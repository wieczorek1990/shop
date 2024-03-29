shop
====

Sample basic shop implementation.

# Database schema

User:
    email
    encrypted_password
    first_name
    last_name
    date_of_birth
    telephone_number
    newsletter
    addresses [] : Address
    additional_info : Profile
    basket : Basket

Address:
	first_name
	last_name
	address_line_1
	address_line_2
	postal_code
	city
	country : Country

Country:
	name

Product:
	category : Category
	name
	description
	producer : Producer
	image : Image
	availability
	net_price
	gross_price

Producer:
	name

Delivery:
	name
	cost

PaymentMethod:
	name

Category:
	categories [] : Category - nested_set (left, right, parent_id, depth)
	name

Order:
	address : Address
	value
	order_positions [] : OrderPosition
	status
	delivery_cost
	delivery : Delivery
	payment_method : PaymentMethod
	user : User

OrderPosition:
	product : Product
	price
	amount

Basket:
	user : User
	order_positions [] : OrderPosition
