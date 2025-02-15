      CREATE TABLE "Employee" (
    "emp_no" INT NOT NULL,
    "emp_title" VARCHAR(255) NULL,
    "birth_date" DATE NULL,
    "first_name" VARCHAR(255) NULL,
    "last_name" VARCHAR(255) NULL,
    "sex" VARCHAR(1) NULL,
    "hire_date" DATE NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY ("emp_no")
);

CREATE TABLE "Titles" (
    "Title_ID" VARCHAR(255) NOT NULL,
    "Title" VARCHAR(255) NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY ("Title_ID")
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(255) NOT NULL,
    "dept_name" VARCHAR(255) NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(255) NOT NULL,
    "emp_no" INT NOT NULL,
    PRIMARY KEY ("dept_no", "emp_no")
);


ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

