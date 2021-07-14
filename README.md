# Week 1 Paired Project 

## Relational Rails ReadME

### Learning Goals
- Design a one to many relationship using a schema designer
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use Rails to create web pages that allow users to CRUD resources
- Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
- Write model and feature tests that fully cover data logic and user behavior

### Collaboration
- As a group took a Kanban style approach to maximize efficiency
- Used a custom pull request template
- Beginning of work sessions group members shared findings and ideas

### Project Overview
- Ultilized database schema designer to set up migrations
- Properly used Model View Controller navigation
- Used Test Driven Development to guide the project
- Achieved 100% coverage in model and feature testing (125 tests)
- Implemented ActiveRecord queries primarilly for sort and filter functions
- Implemented Bootstrap

### Databases and ActiveRecord
- Postgres
- Postico
- DB designer

<img width="607" alt="Screen Shot 2021-07-14 at 1 22 06 PM" src="https://user-images.githubusercontent.com/80132364/125687926-baf22e51-248c-4ad8-b3bb-c951636e27f2.png">

### TDD
- RSpec
- Capybara
- Launchy
- Orderly
- SimpleCov
- Pry 
- Should-Matchers

### System Requirements
- Rails version 5.2.5
- Ruby 2.7.2
- Postgres
- All routes in config were included by handroll


<img width="883" alt="Screen Shot 2021-07-14 at 10 59 07 AM" src="https://user-images.githubusercontent.com/80132364/125670330-47f2a403-82dd-4fd0-bb02-63dc659e4abb.png">



User Stories

Iteration 1
CRUD
```
[x] done

User Story 1, Parent Index (x2)

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system
```

```
[x] done

User Story 2, Parent Show (x2)

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes:
- data from each column that is on the parent table
```

```
[x] done

User Story 3, Child Index (x2)

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes:
```

```
[x] done

User Story 4, Child Show (x2)

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes:
```

```
[x] done

User Story 5, Parent Children Index (x2)

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes:
```
ActiveRecord
```
[x] done

User Story 6, Parent Index sorted by Most Recently Created (x2)

As a visitor
When I visit the parent index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created
```

```
[x] done

User Story 7, Parent Child Count (x2)

As a visitor
When I visit a parent's show page
I see a count of the number of children associated with this parent
```
Usability
```
[x] done

User Story 8, Child Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Child Index

```

```
[x] done

User Story 9, Parent Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Parent Index
```

```
[x] done

User Story 10, Parent Child Index Link

As a visitor
When I visit a parent show page ('/parents/:id')
Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
```
Iteration 2
CRUD

```
[x] done

User Story 11, Parent Creation (x2)

As a visitor
When I visit the Parent Index page
Then I see a link to create a new Parent record, "New Parent"
When I click this link
Then I am taken to '/parents/new' where I  see a form for a new parent record
When I fill out the form with a new parent's attributes:
And I click the button "Create Parent" to submit the form
Then a `POST` request is sent to the '/parents' route,
a new parent record is created,
and I am redirected to the Parent Index page where I see the new Parent displayed.
```

```
[x] done

User Story 12, Parent Update (x2)

As a visitor
When I visit a parent show page
Then I see a link to update the parent "Update Parent"
When I click the link "Update Parent"
Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/parents/:id',
the parent's info is updated,
and I am redirected to the Parent's Show page where I see the parent's updated info
```

```
[x] done

User Story 13, Parent Child Creation (x2)

As a visitor
When I visit a Parent Childs Index page
Then I see a link to add a new adoptable child for that parent "Create Child"
When I click the link
I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
When I fill in the form with the child's attributes:
And I click the button "Create Child"
Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
a new child object/row is created for that parent,
and I am redirected to the Parent Childs Index page where I can see the new child listed
```

```
[x] done

User Story 14, Child Update (x2)

As a visitor
When I visit a Child Show page
Then I see a link to update that Child "Update Child"
When I click the link
I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
When I click the button to submit the form "Update Child"
Then a `PATCH` request is sent to '/child_table_name/:id',
the child's data is updated,
and I am redirected to the Child Show page where I see the Child's updated information
```

ActiveRecord

```
[x] done

User Story 15, Child Index only shows `true` Records (x2)

As a visitor
When I visit the child index
Then I only see records where the boolean column is `true`
```

```
[x] done

User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)

As a visitor
When I visit the Parent's children Index Page
Then I see a link to sort children in alphabetical order
When I click on the link
I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
```

Usability

```
[x] done

User Story 17, Parent Update From Parent Index Page (x2)

As a visitor
When I visit the parent index page
Next to every parent, I see a link to edit that parent's info
When I click the link
I should be taken to that parents edit page where I can update its information just like in User Story 4
```

```
[x] done

User Story 18, Child Update From Childs Index Page (x1)

As a visitor
When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to edit that child's info
When I click the link
I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
```
Iteration 3
CRUD

```
[x] done

User Story 19, Parent Delete (x2)

As a visitor
When I visit a parent show page
Then I see a link to delete the parent
When I click the link "Delete Parent"
Then a 'DELETE' request is sent to '/parents/:id',
the parent is deleted, and all child records are deleted
and I am redirected to the parent index page where I no longer see this parent
```

```
[x] done

User Story 20, Child Delete (x2)

As a visitor
When I visit a child show page
Then I see a link to delete the child "Delete Child"
When I click the link
Then a 'DELETE' request is sent to '/child_table_name/:id',
the child is deleted,
and I am redirected to the child index page where I no longer see this child
```
ActiveRecord

```
[x] done

User Story 21, Display Records Over a Given Threshold (x2)

As a visitor
When I visit the Parent's children Index Page
I see a form that allows me to input a number value
When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
Then I am brought back to the current index page with only the records that meet that threshold shown.
```
Usability

```
[x] done

User Story 22, Parent Delete From Parent Index Page (x1)

As a visitor
When I visit the parent index page
Next to every parent, I see a link to delete that parent
When I click the link
I am returned to the Parent Index Page where I no longer see that parent
```

```
[x] done

User Story 23, Child Delete From Childs Index Page (x1)

As a visitor
When I visit the `child_table_name` index page or a parent `child_table_name` index page
Next to every child, I see a link to delete that child
When I click the link
I should be taken to the `child_table_name` index page where I no longer see that child
```
Extensions

```
[x] done

Sort Parents by Number of Children (x2)

As a visitor
When I visit the Parents Index Page
Then I see a link to sort parents by the number of `child_table_name` they have
When I click on the link
I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name
```

```
[x] done

Search by name (exact match)

As a visitor
When I visit an index page ('/parents') or ('/child_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an exact match of one or more of my records and press the Search button
Then I only see records that are an exact match returned on the page
```

```
[x] done

Search by name (partial match)

As a visitor
When I visit an index page ('/parents') or ('/child_table_name')
Then I see a text box to filter results by keyword
When I type in a keyword that is an partial match of one or more of my records and press the Search button
Then I only see records that are an partial match returned on the page

This functionality should be separate from your exact match functionality.
``` 
