<?php

namespace App\Repository;

use App\Entity\Reclame;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Reclame>
 *
 * @method Reclame|null find($id, $lockMode = null, $lockVersion = null)
 * @method Reclame|null findOneBy(array $criteria, array $orderBy = null)
 * @method Reclame[]    findAll()
 * @method Reclame[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReclameRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Reclame::class);
    }

//    /**
//     * @return Reclame[] Returns an array of Reclame objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('r.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Reclame
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
