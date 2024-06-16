<?php

namespace App\Controller;

use App\Entity\Articles;
use App\Entity\Blocks;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GetBlockByIdController extends AbstractController
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/article/{articleId}/blocks', name: 'app_get_blocks_by_article_id', methods: ['GET'])]
    public function getBlocksByArticleId(int $articleId): Response
    {
        // Получаем статью по её ID
        $article = $this->entityManager->getRepository(Articles::class)->find($articleId);

        // Если статья не найдена, возвращаем ошибку 404
        if (!$article) {
            return new JsonResponse(['error' => 'Article not found'], Response::HTTP_NOT_FOUND);
        }

        // Получаем блоки, связанные со статьей
        $blocks = $article->getBlocks();

        // Сериализуем блоки в массив
        $serializedBlocks = $this->serializeBlocks($blocks);

        // Возвращаем информацию о блоках в виде JSON
        return new JsonResponse(['blocks' => $serializedBlocks]);
    }

    private function serializeBlocks(Collection $blocks): array
    {
        // Сериализуем блоки в массив
        $serializedBlocks = [];
        foreach ($blocks as $block) {
            $serializedBlock = [
                'id' => $block->getId(),
                'type' => $block->getType(),
                'content' => $block->getContent(),
                'title' => $block->getTitle(),
                // Другие данные блока, если нужно
            ];
            $serializedBlocks[] = $serializedBlock;
        }

        return $serializedBlocks;
    }
}
