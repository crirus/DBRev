<?php
    $projects = DBV::getProjects();
    if(empty($_POST['project'])) $_POST['project'] = $_GET['project'];    
    if(empty($_POST['project'])){
        $project = $projects[0];
    }else{
        foreach ($projects as $project) {
            if($project->name == $_POST['project']){
                break;                                
            }
        }
        if(empty($project)) $project = $projects[0];
    }
