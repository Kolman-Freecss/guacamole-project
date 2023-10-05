-- 03/09/2023: Alter table guacamole_user_connection_comment add `user_connection_comment_id`
ALTER TABLE `guacamole_connection_history`
    ADD COLUMN `user_connection_comment_id` INT(11) DEFAULT NULL,
    ADD CONSTRAINT `guacamole_connection_history_ibfk_4`
    FOREIGN KEY (`user_connection_comment_id`)
    REFERENCES `guacamole_user_connection_comment` (`id`)
    ON DELETE SET NULL;



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