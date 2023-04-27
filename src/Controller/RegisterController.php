<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Routing\Annotation\Route;

class RegisterController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */

    public function register(Request $request, EntityManagerInterface $entityManager, UserPasswordEncoderInterface $userPasswordEncoderInterface): Response
    {
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $user->setPassword(
                $userPasswordEncoderInterface->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
                );
            $user->setRoles(["ROLE_USER"]);
            
            //Enregistrement OK
            $entityManager->persist($user);
            $entityManager->flush();

            /* 

                return $guardHandler->authenticateUserAndHandleSucess(
                $user,
                $request,
                $authenticator,
                'main' //Fait référence au firewall du security.yaml
            );*/
        
        }

        
        return $this->render("auth/register.html.twig", [
            "form" => $form->createView()
        ]);
        
    }

    
}