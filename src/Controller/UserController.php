<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Knp\Component\Pager\PaginatorInterface;

/**
 * @Route("/user", name="user_")
 * @package App\Controller
 */
class UserController extends AbstractController {

    /**
     * @Route("/", name="index", methods={"GET"})
     */
    public function index(UserRepository $UserRepository, PaginatorInterface $paginator, Request $request): Response 
    {   

        $findUser = $paginator->paginate(
            $UserRepository->findAll(),
            $request->query->getInt('page', 1), /*page number*/
            6 /*limit per page*/
        );
        /**
         * On récupere la liste des User grâce au findAll
         */
        return $this->render('user/index.html.twig', [
            'users' => $findUser
        ]);
    }

    /**
     * @Route("/new", name="new", methods={"POST", "GET"})
     */
    public function new(Request $request, UserRepository $userRepository): Response {
        /**
         * On envoie un User dans la db
         */
        $user = new User();
        $form = $this->createForm(UserType::class, $user);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $userRepository->add($user);
            $this->addFlash('success', 'Utilisateur enregistré');
            return $this->redirectToRoute('User_index');
        }

        return $this->render('User/new.html.twig', [
            'User' => $user,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/{id}", name="show", methods={"GET"})
     */
    public function show(User $user): Response
    {
        /**
         * On regarde un User en particulier en fonction de l'id
         */
        return $this->render('user/show.html.twig', [
            'user' => $user
        ]);
    }

    /**
     * @Route("/{id}/edit", name="edit", methods={"GET", "POST"})
     */

     public function edit(Request $request, User $user, UserRepository $userRepository): Response {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $userRepository->add($user);
            $this->addFlash('success', 'Info(s) Utilisateur editée(s)');
            return $this->redirectToRoute('user_index');
        }

        return $this->render('User/edit.html.twig', [
            'user' => $user,
            'form' => $form->createView()
        ]);

     }

    /**
     * @Route("/{id}", name="delete", methods={"POST"})
     */
    public function delete(User $user, UserRepository $userRepository): Response {
        /**
         * On supprimer un User
         */
        
        $userRepository->remove($user);
        $this->addFlash('success', 'Utilisateur supprimé');

        return $this->redirectToRoute('user_index', [], Response::HTTP_SEE_OTHER);
    }
}
