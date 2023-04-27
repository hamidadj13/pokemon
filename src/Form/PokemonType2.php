<?php

namespace App\Form;


use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Range;

class PokemonType2 extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class)

            ->add('numero', NumberType::class, [
                "constraints" => [ 
                    new NotBlank(), //NotBlank() c'est pour que le champ est obligatoire et Range c'est pour donner la valeur minimale et maximale ainsi que les messages
                    new Range([
                        "min" => 1,
                        "max" => 150,
                        "minMessage" => "La valeur doit etre supérieure à {{ min }}",
                        "maxMessage" => "La valeur doit etre inférieure à {{ max }}"
                    ])
                ],
                "label" => "Numéro",
                "invalid_message" => "Veuillez entrer un nombre"
            ])

            ->add("type", ChoiceType::class, [
                "constraints" => [ 
                    new NotBlank(["message" => "Veuillez choisir un type"])
                ],
                "choices" =>[
                    "Choisissez un type" => NULL,
                    "Feu" => "Feu",
                    "Eau" => "Eau",
                    "Fee" => "Fee",
                    "Psy" =>"Psy",
                    "Electrique" => "Electrique",
                ]
            ])

            ->add("anniversaire", DateTimeType::class)
            ->add("Submit", SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
