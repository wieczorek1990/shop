class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    unless user.has_role? :admin
      unless user.new_record?
        can :manage, [Address, Basket, User, OrderPosition], :user_id => user.id
        can :manage, OrderPosition, :container_id => user.basket.id, :container_type => 'Basket'
        can [:create, :read], Order, :user_id => user.id
      end
      can :read, Category
      can :read, Product
    else
      can :manage, :all
    end
  end
end
