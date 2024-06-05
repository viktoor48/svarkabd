<?php

namespace App\Controller;

use App\Entity\Reclame;
use App\Entity\Articles;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class AddReclameController extends AbstractController
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/add/reclame', name: 'app_add_reclame', methods: ['POST'])]
    public function addReclame(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        // Проверяем, что все необходимые данные переданы
        if (!isset($data['article_id'], $data['link'])) {
            return new JsonResponse(['error' => 'Invalid data'], Response::HTTP_BAD_REQUEST);
        }

        // Получаем статью по её ID
        $article = $this->entityManager->getRepository(Articles::class)->find($data['article_id']);

        // Если статья не найдена, возвращаем ошибку 404
        if (!$article) {
            return new JsonResponse(['error' => 'Article not found'], Response::HTTP_NOT_FOUND);
        }

        // Создаем новый объект рекламы
        $reclame = new Reclame();
        $reclame->setText($data['text'] ?? null); // text - необязательное поле
        $reclame->setLink($data['link']);
        $reclame->setArticle($article);

        // Сохраняем рекламу в базе данных
        $this->entityManager->persist($reclame);
        $this->entityManager->flush();

        // Возвращаем успешный ответ
        return new JsonResponse(['message' => 'Reclame added successfully'], Response::HTTP_CREATED);
    }
}
