<?php

    namespace App\Controller;

    use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
    use Symfony\Component\HttpFoundation\Request;
    use Symfony\Component\HttpFoundation\Response;
    use Symfony\Component\Routing\Annotation\Route;

    /**
     * @Route("/test", name="mon_")
     * @package App\Controller
    */

    class MonController extends AbstractController
    {

        /**
         * @Route("/test1", name="test1", methods={"GET"})
         * @return Response
         */

        public function index(): Response
        {
            $tab = ["name" => "Bernard", "age" => 15]; 
            return $this->render("mon_template.html.twig", $tab);
            //return new Response("Hello test");
        }

        /**
         * @Route("/tata", name="tata", methods={"GET"})
         * @return Response
         */

        public function tata(Request $request): Response
        {
            dd($request);
        }

        /**
         * @Route("/toto/{id<\d+>}", name="toto")
         * @return Response
         */

        public function index1(int $id): Response
        {
            return new Response($id);
        }
    }
?>

