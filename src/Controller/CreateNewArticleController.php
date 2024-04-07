<?php

namespace App\Controller;

use App\Entity\Articles;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Blocks;
use App\Entity\Categories;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Users;

class CreateNewArticleController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/create/new/article', name: 'app_create_new_article', methods: ['POST'])]
    public function createNewArticle(Request $request): Response
    {
        // Получаем данные из запроса
        $requestData = json_decode($request->getContent(), true);

        // Получаем идентификатор пользователя из данных запроса
        $userId = $requestData['userId'];

        // Находим пользователя по идентификатору
        $user = $this->entityManager->getRepository(Users::class)->find($userId);

        // Проверяем, найден ли пользователь
        if (!$user) {
            // Возвращаем ошибку, если пользователь не найден
            return new JsonResponse(['error' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        // Создаем новую статью
        $newArticle = new Articles();
        $newArticle->setName($requestData['article']['text']); // Устанавливаем текст статьи
        $newArticle->setImage($requestData['article']['image']); // Устанавливаем изображение статьи
        $newArticle->setDate($requestData['date']);

        // Привязываем пользователя к статье
        $newArticle->setCreator($user);

        // Получаем идентификатор категории из данных запроса
        $categoryId = $requestData['categoryId'];

        // Находим категорию по идентификатору
        $category = $this->entityManager->getRepository(Categories::class)->find($categoryId);

        // Проверяем, найдена ли категория
        if (!$category) {
            // Возвращаем ошибку, если категория не найдена
            return new JsonResponse(['error' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }

        // Привязываем категорию к статье
        $newArticle->setCategory($category);

        // Сохраняем статью в базе данных
        $this->entityManager->persist($newArticle);
        $this->entityManager->flush();

        // Получаем идентификатор созданной статьи
        $articleId = $newArticle->getId();

        // Создаем блоки для статьи, если они предоставлены
        if (!empty($requestData['blocks'])) {
            foreach ($requestData['blocks'] as $blockData) {
                $block = new Blocks();
                $block->setType($blockData['type']);
                $block->setContent($blockData['content']);
                $block->setTitle($blockData['title']);

                // Привязываем блок к созданной статье по ее идентификатору
                $block->setArticle($this->entityManager->getReference(Articles::class, $articleId));

                // Сохраняем блок
                $this->entityManager->persist($block);
            }

            // Сохраняем все изменения в базе данных после создания всех блоков
            $this->entityManager->flush();
        }

        // Возвращаем ответ
        return new JsonResponse(['message' => 'Article created successfully', 'articleId' => $articleId], Response::HTTP_CREATED);
    }
}
