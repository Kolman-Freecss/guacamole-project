
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