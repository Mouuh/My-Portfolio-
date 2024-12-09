-- 1. Liste des médecins ophtalmologues
-- Cette requête récupère la liste des médecins dont la spécialité est "ophtalmologue"
select medecine.nom_med,
       medecine.prenom_med,
       specialite.designation_spe
  from medecine
  join specialite
on medecine.code_spe = specialite.code_spe
 where specialite.designation_spe = 'ophtalmologue';

-- 2. Nombre de médecins par spécialité
-- Cette requête compte le nombre de médecins par spécialité
select specialite.designation_spe,
       count(medecine.code_med) as nombre_medecins
  from medecine
  join specialite
on medecine.code_spe = specialite.code_spe
 group by specialite.designation_spe;

-- 3. Nombre de médecins par service
-- Cette requête compte le nombre de médecins par service
select le_service.designation_serv,
       count(medecine.code_med) as nombre_medecins
  from medecine
  join le_service
on medecine.code_serv = le_service.code_serv
 group by le_service.designation_serv;

-- 4. Les services actifs (qui ont un nombre de médecins > 4)
-- Cette requête sélectionne les services ayant plus de 4 médecins
select le_service.designation_serv
  from le_service
  join medecine
on le_service.code_serv = medecine.code_serv
 group by le_service.designation_serv
having count(medecine.code_med) > 4;

-- 5. Chaque malade avec son service
-- Cette requête liste chaque malade et le service auquel il est affecté
select malade.nom_mal,
       malade.prenom_mal,
       le_service.designation_serv
  from malade
  join affecte_a
on malade.code_mal = affecte_a.code_mal
  join le_service
on affecte_a.code_serv = le_service.code_serv;

-- 6. Liste des malades qui n’ont pas encore affectés à un service
-- Cette requête récupère les malades qui n'ont pas encore de service affecté
select malade.nom_mal,
       malade.prenom_mal
  from malade
  left join affecte_a
on malade.code_mal = affecte_a.code_mal
 where affecte_a.code_serv is null;

-- 7. Le service affecté à chaque médecin
-- Cette requête liste le service affecté à chaque médecin
select medecine.nom_med,
       medecine.prenom_med,
       le_service.designation_serv
  from medecine
  join le_service
on medecine.code_serv = le_service.code_serv;

-- 8. L’historique de l'entrée des malades à l’hôpital
-- Cette requête montre l'historique des entrées des malades avec la date et le service
select malade.nom_mal,
       malade.prenom_mal,
       affecte_a.date_e,
       le_service.designation_serv
  from malade
  join affecte_a
on malade.code_mal = affecte_a.code_mal
  join le_service
on affecte_a.code_serv = le_service.code_serv
 order by affecte_a.date_e;

-- 9. Nombre total des malades
-- Cette requête compte le nombre total de malades
select count(code_mal) as total_malades
  from malade;

-- 10. Nombre total des médecins
-- Cette requête compte le nombre total de médecins
select count(code_med) as total_medecins
  from medecine;

-- 11. Les services vides (sans médecins)
-- Cette requête liste les services qui n'ont pas de médecins affectés
select le_service.designation_serv
  from le_service
  left join medecine
on le_service.code_serv = medecine.code_serv
 where medecine.code_med is null;

-- 12. Savoir si la spécialité "dermatologue" existe
-- Cette requête vérifie si la spécialité "dermatologue" existe
select case
          when exists (
             select 1
               from specialite
              where designation_spe = 'dermatologue'
          ) then
             'La spécialité dermatologue existe'
          else
             'La spécialité dermatologue n existe pas'
       end as resultat;

-- 13. Liste des médecins qui n’ont pas encore affectés à leur service
-- Cette requête récupère les médecins sans service affecté
select medecine.nom_med,
       medecine.prenom_med
  from medecine
  left join le_service
on medecine.code_serv = le_service.code_serv
 where medecine.code_serv is null;

-- 14. Les services qui n’ont pas de médecins
-- Cette requête liste les services qui n'ont pas de médecins affectés
select le_service.designation_serv
  from le_service
  left join medecine
on le_service.code_serv = medecine.code_serv
 where medecine.code_med is null;

-- 15. Liste des malades entrés à l’hôpital dans le mois de février
-- Cette requête récupère les malades qui sont entrés à l'hôpital en février
select malade.nom_mal,
       malade.prenom_mal,
       affecte_a.date_e
  from malade
  join affecte_a
on malade.code_mal = affecte_a.code_mal
 where to_char(
   affecte_a.date_e,
   'MM'
) = '02';