<?php

namespace App\Entity\Traits;

use Datetime;
use Doctrine\ORM\Mapping as ORM;

trait TimestampTrait
{
    /**
     * @var \Datetime $created_at
     * 
     * @ORM\Column(type="datetime")
     */
    private $created_at = NULL;

    /**
     * @var \Datetime $updated_at
     * 
     * @ORM\Column(type="datetime")
     */
    private $updated_at = NULL;

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt($createdAt)
    {
        $this->created_at = $createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updated_at;
    }

    public function setUpdatedAt($updatedAt)
    {
        return $this->updated_at;
    }
}
