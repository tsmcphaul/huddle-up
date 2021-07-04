# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - A User has many tasks. A Project has many tasks. 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -  The Task models exhibits the belongs to relationship with User and Project.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - A User has many projects through tasks. A Project has many users through tasks. 
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - A User has many projects through tasks. A Project has many users through tasks. 
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - User can add task via project.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - added validates_presence_of and validates_uniqueness_of
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - add scope method to task to filter all unfinished tasks
- [x] Include signup - new user form
- [x] Include login - login form
- [x] Include logout - deletes session
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Google OAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - nested routes for user to see their tasks and specific task.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - form allows user to choose project and user
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - if there are any errors, errors are displayed in list form

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate