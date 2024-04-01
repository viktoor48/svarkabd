<?php

namespace App\Controller;

use App\Entity\Users;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface; // Импортируем EntityManagerInterface

class AuthorizationController extends AbstractController
{
    private EntityManagerInterface $entityManager; // Внедряем EntityManagerInterface

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/authorization', name: 'app_authorization')]
    public function index(): Response
    {
        return $this->render('authorization/index.html.twig', [
            'controller_name' => 'AuthorizationController',
        ]);
    }

    #[Route('/login', name: 'app_login', methods: ['POST'])]
    public function login(Request $request): Response
    {
        $data = json_decode($request->getContent(), true);

        // Получаем email и пароль из запроса
        $email = $data['email'] ?? null;
        $password = $data['password'] ?? null;

        if (!$email || !$password) {
            // Если email или пароль не были переданы, возвращаем ошибку
            return new JsonResponse(['error' => 'Email and password are required'], Response::HTTP_BAD_REQUEST);
        }

        // Поиск пользователя по email
        $user = $this->entityManager->getRepository(Users::class)->findOneBy(['email' => $email]);

        if (!$user) {
            // Если пользователь с таким email не найден, возвращаем ошибку
            return new JsonResponse(['error' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        // Проверка пароля
        if ($user->getPassword() !== $password) {
            // Если пароль неверный, возвращаем ошибку
            return new JsonResponse(['error' => 'Invalid credentials'], Response::HTTP_UNAUTHORIZED);
        }

        // Возвращаем данные пользователя в формате JSON
        return $this->json([
            'id' => $user->getId(),
            'name' => $user->getName(),
            'email' => $user->getEmail(),
        ]);
    }
}
