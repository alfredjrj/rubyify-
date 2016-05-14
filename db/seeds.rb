# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Page.delete_all

Page.create(id: 1, store_id: 1, name: "About", template: %{
 <h1> Hello {{ store.name }} </h1>
  
  We are located {{ store.address }}.
  
  <h1>  Here why we are different </h1>
     {{ store.about }}
 
}

)


Page.create(id: 2, store_id: 1, name: "Home", template: %{
 <h1> Hello {{ store.name }} </h1>
  
{% for item in store.items %}    
  <li>{{ item.name }}
  {{ item.price }}</li>
{% endfor %}
 
}

)


Page.create(id: 2, store_id: 1, name: "item", template: %{
 <h1> Hello {{ store.name }} </h1>
  
  We are located {{ store.address }}.
  
  <h1>  Here why we are different </h1>
     {{ store.about }}
 
}

)

# Page.create(id: 2, user: "Bob", template: %{
#   What is up my man?!? Here is your shopping list.
#   <ul>
#     {% for item in list %}
#       <li>{{ item.name }}</li>
#     {% endfor %}
#   </ul>
# }
# )

# Page.create(id: 3, user: "Chris", template: %{
#   HTTP 200:  Shopping List Found

#   Items in your list:
#   <ul>
#     {% for item in list %}
#       <li>{{ item.name }}</li>
#     {% endfor %}
#   </ul>
# }

# )