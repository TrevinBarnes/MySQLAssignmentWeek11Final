DROP TABLE IF EXISTS projects_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS projects;

CREATE TABLE projects (
	projects_id INT /*AUTO_INCREMENT*/ NOT NULL,
	projects_name VARCHAR (128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (projects_id)
);

CREATE TABLE material (
	material_id INT /*AUTO_INCREMENT*/ NOT NULL,
	projects_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY(material_id),
	FOREIGN KEY(projects_id) REFERENCES projects (projects_id) ON DELETE CASCADE
);


CREATE TABLE step (
	step_id INT /*AUTO_INCREMENT*/ NOT NULL,
	projects_id INT NOT NULL,
	step_order INT NOT NULL,
	step_text TEXT NOT NULL,
	PRIMARY KEY(step_id),
	FOREIGN KEY(projects_id) REFERENCES projects (projects_id) ON DELETE CASCADE
);

CREATE TABLE category (
	category_id INT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE projects_category (
	projects_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY(projects_id) REFERENCES projects (projects_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (projects_id,category_id)
);

INSERT INTO projects (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES('Hang door hangers',4,3,3,'Use hangers from Home Depot');
INSERT INTO material(project_id, material_name, num_required, cost) VALUES(1,'Door hangers',3,7.80);
INSERT INTO material(project_id, material_name, num_required, cost) VALUES(1,'Screws', 20, 4.10);
INSERT INTO step (project_id, step_text, step_order) VALUES(1, 'Align hangers on opening side door'1);
INSERT INTO step (project_id, step_text, step_order) VALUES(1,'Screwhangers into frame',2);
INSERT INTO category(category_id, category_name) VALUES(1, 'Doors adn Windows');
INSERT INTO category(category_id, category_name) VALUES(2, 'Repairs');
INSERT INTO category(category_id, category_name) VALUES(3, 'Gardening');
INSERT INTO projects_category (project_id, category_id) VALUES(1,1);
INSERT INTO projects_category (project_id, category_id) VALUES(1,2);







