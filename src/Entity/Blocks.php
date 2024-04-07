<?php

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\BlocksRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: BlocksRepository::class)]
#[ApiResource]
class Blocks
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $type = null;

    #[ORM\Column(type: 'text')]
    private ?string $content = null;

    #[ORM\ManyToOne(inversedBy: 'blocks')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Articles $article = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $title = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): static
    {
        $this->content = $content;

        return $this;
    }

    public function getArticle(): ?articles
    {
        return $this->article;
    }

    public function setArticle(?articles $article): static
    {
        $this->article = $article;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(?string $title): static
    {
        $this->title = $title;

        return $this;
    }
}
