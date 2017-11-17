# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Subject has_many :areas, Subject model line 2)
- [x] Include at least one belongs_to relationship (Corollary belongs_to :theorem, Corollary model line 2 )
- [x] Include at least one has_many through relationship (Scientist has_many :areas, through: theorems, Scientist model line 4 )
- [x] The "through" part of the has_many through includes at least one user submittable attribute (area.name, area.created_by and area.subject_id)
- [x] Include reasonable validations for simple model objects (User, Theorem, Area, Scientist, Corollry, Subject)
- [x] Include a class level ActiveRecord scope method (Scope :created today in both scientist and theorem models URL:/created_today)
- [x] Include a nested form writing to an associated model using a custom attribute writer (Nested form can be found in scientist’s new page, creating first Theorem and SCIentist)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth)
- [x] Include nested resource show or index (scientists/3/theorems/2)
- [x] Include nested resource "new" form (scientists/1/theorems/new)
- [x] Include form display of validation errors (In every new form partial of every resource, there’s a section to display errors related to validations failing while creating the new resource. Look under every views/resource_folder/form )

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
