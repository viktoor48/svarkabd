<?php

namespace App\Controller;

use App\Entity\Articles;
use App\Entity\Blocks;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class DeleteArticleController extends AbstractController
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/delete/article/{id}', name: 'app_delete_article')]
    public function deleteArticle(int $id): Response
    {
        $article = $this->entityManager->getRepository(Articles::class)->find($id);
        
        if (!$article) {
            throw $this->createNotFoundException('Article not found');
        }
        
        // Удаляем все блоки, связанные с этой статьей
        $blocks = $article->getBlocks();
        foreach ($blocks as $block) {
            $this->entityManager->remove($block);
        }
        
        $this->entityManager->remove($article);
        $this->entityManager->flush();

        return new Response('Article and related blocks successfully deleted');
    }
}
