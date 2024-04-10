<?php

namespace App\Controller;

use App\Entity\Articles;
use App\Entity\Blocks;
use App\Entity\Users;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EditArticleController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/edit/article/{id}', name: 'app_edit_article', methods: ['POST'])]
    public function editArticle(Request $request, int $id): Response
    {
        // Получаем данные из запроса
        $requestData = json_decode($request->getContent(), true);

        // Находим статью по идентификатору
        $article = $this->entityManager->getRepository(Articles::class)->find($id);

        // Проверяем, найдена ли статья
        if (!$article) {
            // Возвращаем ошибку, если статья не найдена
            return new JsonResponse(['error' => 'Article not found'], Response::HTTP_NOT_FOUND);
        }

        // Обновляем данные статьи
        $article->setName($requestData['article']['text']);
        $article->setImage($requestData['article']['image']);
        $article->setDate($requestData['date']);

        // Сохраняем изменения статьи
        $this->entityManager->flush();

        // Проверяем наличие блоков в данных запроса
        if (!empty($requestData['blocks'])) {
            foreach ($requestData['blocks'] as $blockData) {
                // Проверяем, есть ли идентификатор блока
                if (isset($blockData['id'])) {
                    // Если идентификатор блока есть, обновляем существующий блок
                    $block = $this->entityManager->getRepository(Blocks::class)->find($blockData['id']);

                    // Проверяем, найден ли блок
                    if (!$block) {
                        // Возвращаем ошибку, если блок не найден
                        return new JsonResponse(['error' => 'Block not found'], Response::HTTP_NOT_FOUND);
                    }

                    // Обновляем данные блока
                    $block->setType($blockData['type']);
                    $block->setContent($blockData['content']);
                    $block->setTitle($blockData['title']);
                } else {
                    // Если идентификатор блока отсутствует, создаем новый блок
                    $block = new Blocks();
                    $block->setType($blockData['type']);
                    $block->setContent($blockData['content']);
                    $block->setTitle($blockData['title']);
                    $block->setArticle($article); // Привязываем блок к статье
                    $this->entityManager->persist($block); // Сохраняем новый блок
                }
            }

            // Сохраняем все изменения в базе данных
            $this->entityManager->flush();
        }

        // Возвращаем ответ об успешном выполнении операции
        return new JsonResponse(['message' => 'Article updated successfully'], Response::HTTP_OK);
    }
}
