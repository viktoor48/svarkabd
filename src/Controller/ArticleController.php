<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Entity\Articles;
use App\Entity\Reclame;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface; // Импортируем EntityManagerInterface
use Doctrine\Common\Collections\Collection;

class ArticleController extends AbstractController
{
    private EntityManagerInterface $entityManager; // Внедряем EntityManagerInterface

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/category/{categoryId}/article/{articleId}', name: 'get_article_by_category_and_id', methods: ['GET'])]
    public function getArticleByCategoryIdAndId(int $categoryId, int $articleId): Response
    {
        // Получаем категорию по её ID
        $category = $this->entityManager->getRepository(Categories::class)->find($categoryId);

        // Если категория не найдена, возвращаем ошибку 404
        if (!$category) {
            return new JsonResponse(['error' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }

        // Получаем статью по её ID
        $article = $this->entityManager->getRepository(Articles::class)->find($articleId);

        // Если статья не найдена, возвращаем ошибку 404
        if (!$article) {
            return new JsonResponse(['error' => 'Article not found'], Response::HTTP_NOT_FOUND);
        }

        // Проверяем, принадлежит ли статья указанной категории
        if ($article->getCategory() !== $category) {
            return new JsonResponse(['error' => 'Article does not belong to the specified category'], Response::HTTP_BAD_REQUEST);
        }

        // Сериализуем категорию в массив
        $serializedCategory = $this->serializeCategory($category);

        // Сериализуем статью в массив
        $serializedArticle = $this->serializeArticle($article);

        // Возвращаем информацию о статье в виде JSON
        return new JsonResponse(['category' => $serializedCategory, 'article' => $serializedArticle]);
    }

    private function serializeCategory(Categories $category): array
    {
        // Сериализуем категорию в массив
        $serializedCategory = [
            'id' => $category->getId(),
            'name' => $category->getName(),
            'image' => $category->getImage(),
            // Другие свойства категории, если нужно
        ];

        return $serializedCategory;
    }

    private function serializeArticle(Articles $article): array
    {
        // Сериализуем статью в массив
        $serializedArticle = [
            'id' => $article->getId(),
            'name' => $article->getName(),
            'date' => $article->getDate(),
            'image' => $article->getImage(),
            // Другие данные статьи...
            'blocks' => $this->serializeBlocks($article->getBlocks()), // Сериализуем блоки статьи
            'reclame' => $this->serializeReclame($article->getReclame()), // Сериализуем рекламу статьи, если она есть
        ];

        return $serializedArticle;
    }

    private function serializeBlocks(Collection $blocks): array
    {
        // Сериализуем блоки статьи в массив
        $serializedBlocks = [];
        foreach ($blocks as $block) {
            $serializedBlock = [
                'id' => $block->getId(),
                'type' => $block->getType(),
                'content' => $block->getContent(),
                'title' => $block->getTitle(),
                // Другие данные блока...
            ];
            $serializedBlocks[] = $serializedBlock;
        }

        return $serializedBlocks;
    }

    private function serializeReclame(?Reclame $reclame): ?array
    {
        // Если рекламы нет, возвращаем null
        if (!$reclame) {
            return null;
        }

        // Сериализуем рекламу в массив
        return [
            'id' => $reclame->getId(),
            'text' => $reclame->getText(),
            'link' => $reclame->getLink(),
            'block' => $reclame->getBlock(),
        ];
    }
}
