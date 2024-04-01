-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 30, 2024 at 04:52 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: disneyland
--

-- --------------------------------------------------------

--
-- Table structure for table characters
--

CREATE TABLE characters (
  id int(15) UNSIGNED NOT NULL,
  name varchar(300) NOT NULL,
  url_image varchar(500) NOT NULL,
  description varchar(1000) NOT NULL,
  enemy_id int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table characters
--

INSERT INTO characters (id, name, url_image, description, enemy_id) VALUES
(1, 'Alice', 'alice.jpeg', 'Alice is the curious and adventurous protagonist of Lewis Carroll\'s classic tale \"Alice\'s Adventures in Wonderland,\" adapted into numerous films and media by Disney. In Disney\'s version, Alice is a young girl with a vivid imagination who finds herself tumbling down a rabbit hole into the fantastical world of Wonderland. Throughout her journey, she encounters a myriad of eccentric characters, including the Cheshire Cat, the Mad Hatter, and the Queen of Hearts. Alice is known for her inquisitive nature, determination, and ability to adapt to the absurdities of Wonderland while maintaining her sense of self.', 1),
(2, 'Ariel', 'ariel.jpeg', 'Ariel is the most well-known meaning. She\'s the adventurous mermaid princess from Disney\'s The Little Mermaid who dreams of living on land.', 2),
(3, 'Aurora', 'aurora.jpeg', 'Aurora possesses a gentle and pure heart. She\'s shown to be compassionate towards all creatures, befriending woodland animals during her childhood.', 3),
(4, 'Aladdin', 'aladdin.jpeg', 'Aladdin, a charming yet streetwise young man, scrambles for survival in the bustling city of Agrabah. Despite his lack of wealth or formal education, Aladdin possesses a kind heart and a clever mind. With a loyal monkey by his side, he dreams of a better life and captures the eye of Princess Jasmine. When fate intervenes with a magic lamp, Aladdin must use his wit and newfound power to navigate the palace, outsmart a devious villain, and prove himself worthy of love and respect.', 4),
(5, 'Beast', 'beast.jpeg', 'The Beast from Disney\'s Beauty and the Beast is a complex character shrouded in mystery. Originally a handsome prince, a curse transformed him into a monstrous creature with a fearsome appearance.', 5),
(6, 'Belle', 'belle.jpeg', 'Belle is known for her intelligence, independence, and love for reading. Belle is kind-hearted and values inner beauty over outward appearances. Her story revolves around her transformative journey of compassion and breaking stereotypes as she befriends the Beast and teaches him about love and acceptance.', 5),
(7, 'Cinderella', 'cinderella.jpeg', 'Cinderella is a classic fairy tale character known for her kindness, resilience, and grace. Despite facing mistreatment from her stepmother and stepsisters, she remains optimistic and kind-hearted. With the help of her Fairy Godmother, she attends the royal ball and captures the heart of the prince. Cinderella\'s story embodies themes of hope, perseverance, and the belief that goodness will ultimately prevail.', 6),
(8, 'Dumbo', 'dumbo.jpeg', 'Dumbo is a young elephant with oversized ears in the Disney animated film of the same name. He is initially ridiculed for his unique appearance but later discovers that his large ears enable him to fly. Dumbo\'s story revolves around self-acceptance, friendship, and overcoming adversity. With the help of his loyal friend Timothy Q. Mouse and his ability to fly, Dumbo gains confidence and proves that being different is a strength.', 7),
(9, 'Hercules', 'hercules.jpeg', 'Hercules is a legendary Greek hero known for his immense strength and courage. In Greek mythology and Disney\'s adaptation, Hercules battles various foes and completes heroic tasks as he seeks to prove himself worthy of joining the gods on Mount Olympus. His enemies include mythical creatures like the Hydra, the Cyclops, and the Titans, as well as antagonists like Hades, the god of the underworld, who schemes to overthrow Zeus and take control of Olympus. Through his trials and triumphs, Hercules embodies the ideals of heroism, perseverance, and self-discovery.', 8),
(10, 'Jasmine', 'jasmine.jpeg', 'Jasmine is a Disney Princess from the movie \"Aladdin.\" She is known for her strong-willed and independent personality, often challenging the traditional roles expected of her as a princess. Jasmine desires freedom and the ability to make her own choices, rather than being confined by royal obligations. She is compassionate, adventurous, and has a deep sense of justice, often standing up for those who are oppressed or mistreated. Jasmine\'s character is defined by her courage, intelligence, and unwavering spirit, making her a beloved and iconic figure in Disney\'s animated universe.', 4);

-- --------------------------------------------------------

--
-- Table structure for table enemies
--

CREATE TABLE enemies (
  id int(20) UNSIGNED NOT NULL,
  name varchar(40) NOT NULL,
  description varchar(400) NOT NULL,
  image_url varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table enemies
--

INSERT INTO enemies (id, name, description, image_url) VALUES
(1, 'Queen of Hearts', 'In Lewis Carroll\'s Alice\'s Adventures in Wonderland, the Queen of Hearts reigns with an iron fist. This short-tempered monarch is a terror to Wonderland, her booming cries of \"Off with their heads!\" striking fear into even the bravest hearts. A symbol of chaotic rage, the Queen embodies the dangers of unchecked passion and throws Wonderland into disarray with her tyrannical rule.', 'queenofhearts.webp'),
(2, 'Ursula', 'Ursula, the sea witch from Disney\'s The Little Mermaid, slithers through the ocean depths with a cunning mind and a flamboyant personality.  This curvaceous villainess tempts those in need with magical deals, but her contracts twist desires into misfortune, furling her own hunger for power.', 'ursula.webp'),
(3, 'Maleficent', 'With horns that pierce the night sky and dark magic crackling at her fingertips, Maleficent, the mistress of all evil from Disney\'s Sleeping Beauty, reigns over a mysterious forest. Though some see only a vengeful fairy scorned by betrayal, her power over nature and ability to transform into a fearsome dragon command both respect and fear.', 'maleficent.webp'),
(4, 'Jafar', 'Jafar, the power-hungry vizier from Disney\'s Aladdin, is a master manipulator with a serpent-like demeanor. Clad in flowing robes and a curled beard, he slithers through the palace, weaving webs of deceit.  Fueled by ambition and a deep disdain for the Sultan, Jafar uses his hypnotic snake staff to control minds and orchestrate schemes to seize the throne.', 'jafar.webp'),
(5, 'Gaston', 'Gaston, the boisterous antagonist from Disney\'s Beauty and the Beast, embodies the epitome of a brawny bully. With bulging muscles, a prideful grin, and a trophy-room full of hunting conquests, he parades his perceived masculinity through the village. Despite his charming facade, Gaston harbors a jealous streak, particularly towards the Beast who captures Belle\'s attention.', 'gaston.webp'),
(6, 'Evil Stepmother', 'The stepmother from Cinderella, often named Lady Tremaine, is the picture of cold elegance.  She lords over her household with a thin smile and a cutting tongue, while her own daughters, Drizella and Anastasia, mimic her cruelty.  Jealous of Cinderella\'s beauty and kindness.', 'stepmother.webp'),
(7, 'Mr.Stalls', 'Clad in a flamboyant red coat and a towering top hat, he barks orders and cracks his whip, keeping the circus in line with a booming voice and an iron fist. More concerned with profit than compassion, the Ringmaster exploits the talents of both animals and workers, viewing them as nothing more than acts in his money-making spectacle.', 'stalls.webp'),
(8, 'Hades', 'Hades, the lord of the underworld in Greek mythology and Disney\'s Hercules, is a powerful, yet often grumpy god.  Despite his imposing title, he\'s not exactly known for being scary.  Ruling over the vast realm of the dead can be a bore, and Hades often complains about his thankless job.  While he might dream of overthrowing his brother Zeus.', 'hades.webp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table characters
--
ALTER TABLE characters
  ADD PRIMARY KEY (id),
  ADD KEY enemy_id (enemy_id);

--
-- Indexes for table enemies
--
ALTER TABLE enemies
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table characters
--
ALTER TABLE characters
  MODIFY id int(15) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table enemies
--
ALTER TABLE enemies
  MODIFY id int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table characters
--
ALTER TABLE characters
  ADD CONSTRAINT enemy_id FOREIGN KEY (enemy_id) REFERENCES enemies (id);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
