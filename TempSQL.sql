-- TEST
-- Create default user connection comment
-- INSERT INTO guacamole_user_connection_comment (user_id, connection_id, comment, created_date)
-- VALUES ((SELECT user_id FROM guacamole_user INNER JOIN guacamole_entity ON guacamole_user.entity_id = guacamole_entity.entity_id WHERE name = 'guacadmin'),
--         1,
--         'Default user connection',
--         NOW());

------ TESTS -----

-- 20/09/2023: Alter table guacamole_user_connection_comment add `connection_name`          varchar(128) NOT NULL 
ALTER TABLE guacamole_user_connection_comment ADD `connection_name` varchar(128) NOT NULL;

-- Alter table guacamole_user_connection_comment change varchar to text on comment
Alter table guacamole_user_connection_comment modify comment text;

-- Table guacamole_user_connection_comment modify USERNAME
Alter table guacamole_user_connection_comment add username varchar(128) NOT NULL;

-- Table guacamole_connection modify
Alter table guacamole_connection add description longtext; 


-- Table created on 14/09/2023
CREATE TABLE `guacamole_user_connection_comment_permission`
(

    `entity_id`           int(11) NOT NULL,
    `user_connection_comment_id` int(11) NOT NULL,
    `permission`          enum('READ',
        'UPDATE',
        'DELETE',
        'ADMINISTER') NOT NULL,

    PRIMARY KEY (`entity_id`, `user_connection_comment_id`, `permission`),

    CONSTRAINT `guacamole_user_connection_comment_permission_ibfk_1`
        FOREIGN KEY (`user_connection_comment_id`)
            REFERENCES `guacamole_user_connection_comment` (`id`) ON DELETE CASCADE,

    CONSTRAINT `guacamole_user_connection_comment_permission_entity`
        FOREIGN KEY (`entity_id`)
            REFERENCES `guacamole_entity` (`entity_id`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;