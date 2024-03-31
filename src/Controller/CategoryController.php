<?php

namespace App\Controller;

use App\Entity\Categories;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategoryController extends AbstractController
{
    #[Route('/category/{id}', name: 'get_articles_by_category_id', methods: ['GET'])]
    public function getArticlesByCategoryId(Categories $category): Response
    {
        $articles = $category->getArticles();

        $serializedArticles = $this->serializeArticles($articles);

        return new JsonResponse($serializedArticles);
    }

    private function serializeArticles($articles): array
    {
        // Serialize articles here as arrays
        $serializedArticles = [];
        foreach ($articles as $article) {
            $serializedArticle = [
                'id' => $article->getId(),
                'name' => $article->getName(),
                'date' => $article->getDate(),
                'image' => $article->getImage(),
                // Add other fields as needed
                // For example, 'category' to get category information
                'category' => [
                    'id' => $article->getCategory()->getId(),
                    'name' => $article->getCategory()->getName(),
                    // Add other category fields if needed
                ],
                // You can also include other related entities here, like creator
                'creator' => [
                    'id' => $article->getCreator()->getId(),
                    'name' => $article->getCreator()->getName(),
                    // Add other creator fields if needed
                ],
                // Add other fields from the article entity
            ];

            $serializedArticles[] = $serializedArticle;
        }
        return $serializedArticles;
    }
}
