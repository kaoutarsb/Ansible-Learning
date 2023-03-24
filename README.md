--------------------Loops Ansible-------------------------------------------------


Loops structures:
1.loop : we use loops just for lists but it's not working for dictionnaries
   but to convert a dictionnary to a list this is the syntax: loop: "{{ example | dict2items }}"
   1.2.range() : used for a list to loop over a range of numbers   
       -Par défaut dans range() le saut est 1 pour choisir un on ecrit comme ca range(début,fin+1,saut)
      ex:  range(10)    0 --> 9
           range(1,10)  1 --> 9
           range(0,256,2) : commence a 0 jusqu'à 255 avec un saut de 2

      
2.with
3.until



Conditions: 

when: we can also use with it the "or" operator & the "and" operator
 
ex : when: >
       ansible_facts['distribution'] == "CentOS" or
       ansible_facts['distribution'] == "RedHat"
       

-------------------------Blocks-------------------------
Blocks: we use blocks to group related tasks together 


----------------------Looping over inventories--------------------
 We can loop over a group of hosts in the inventory or all of them 
 like this:     loop: "{{ groups['all'] }}"   # for all hosts that are in the inventory
                loop: "{{ groups['name_of_the_grp'] }}"    


---------------------Arreter la boucle dans chaque itération---------------
Pour faire cela on utilise après la boucle directement le syntaxe suivant:
     loop_control:
        pause: 1         #1 signifie une seconde

             
-------------------Using when with boolean variables---------------------
ex: 
---
- name:
  hosts: node0
  vars:
    weekend: true
    on_call: "no"
  tasks:
    - name: Run if "weekend" is true and "on_call" is false
      debug:
        msg: "You are free!"
      when: weekend and not on_call | bool         #NOT FALSE = TRUE


------------Test if a variable is defined or not --------------
 
when: var is defined 
OR
when: var is undefined



---------------Continue executing tasks even if a task is failed ----------

To do that we use the following syntax:
       ignore_errors: yes

------------Block named always -------------------------------------------
This task will run whether the block has failed or not
always:
 - name: This will always run
   debug:
     msg: "Whether the block has failed or not ... I will always run!"

-------------Handlers----------------------------------------------------
We use handlers when a change is made on a managed node .
Handlers are tasks that only run when notified. 
