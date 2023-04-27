<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    /**
     * @Route("/login", name="app_login")
     */

    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        if($this->getUser())
        {
            return $this->redirectToRoute('pokemon_index');
        }

        $error = $authenticationUtils->getLastAuthenticationError();

        $lastUserName = $authenticationUtils->getLastUsername();

        return $this->render("auth/login.html.twig", [
            "last_username" => $lastUserName,
            "error" => $error
        ]) ;
   }

    /**
     * @Route("/logout", name="app_logout")
     */

    public function logout(): void
    {
       
    }
}