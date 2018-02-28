class User < ActiveRecord::Base
  # :dependent - Controls what happens to the associated objects when their owner is destroyed:
  # :destroy - causes all the associated objects to also be destroyed (i.e. DESTROYS THE 
  #            RELATIONSHIP RECORD AND ASSOCIATED/DEPENDENT MODEL RECORDS 4.3.2.5)
  # :delete_all - causes all the associated objects to be deleted directly from the database 
  # (so callbacks will not execute)
  # :nullify - causes the Foreign Keys to be set to NULL. 'Save' callbacks are not executed.
  # :restrict_with_exception - causes an exception to be raised if there are any associated records
  # :restrict_with_error - causes an error to be added to the owner if there are any associated objects
  
  EMAIL_REGEX = /\A@\z/i
  
  has_many :secrets #USER is 'owner' of Secrets
  
  has_many :likes, dependent: :destroy   #USER is 'owner' of Likes
  has_many :secrets_liked, through: :likes, source: :secret #Users's Secrets which he/she "liked"

  # BCRYPT method - adds validations, methods, attributes to User Instance:
  has_secure_password

  # VALIDATIONS:
  validates :name, :email, presence: true

  # before_validate :normalize_email
  validates :email, :uniqueness=> true, :format => /@/   # OR....
  
  # validates :email, :uniqueness=> true, :format => {with: EMAIL_REGEX, message: "is invalid"}
  before_save :normalize_email, on: [:create, :update]

  private
    def normalize_email
      puts "Initially: ", self.email, email
      self.email = email.downcase
      puts "After: ", self.email, email, email.downcase
      # or self.email.downcase!
    end
end

# BCrypt Built-In Validations :
# =============================
# - password required only on create, not on update
# - password length should be less than or equal to 72 characters
# - Confirmation of password (using a password_confirmation attribute)
# 
# Attributes:
# ===========
# Even though the columns aren't present in our database,
# BCrypt adds the following attributes to a User instance: 
# * password: We can update our password by manipulating this attribute and saving.
# * password_confirmation: This field must match our password field.

# Methods:
# ========
# BCrypt provides us with an authenticate method (takes in one (1) parameter):
  # a) If the parameter matches the password of the user, 
  # then the method returns the *user* being authenticated,
  # b) If it doesn't match it will return false. We will be using this method when we log a user in.

# CALLBACKS EXAMPLE:
# ==================
# validates :login, :email, presence: true 
# before_validation :ensure_login_has_a_value
 
# private
#   def ensure_login_has_a_value
#     if login.nil?
#       self.login = email unless email.blank?
#     end
#   end
# end

# 3.1 Creating an Object
# before_validation
# after_validation
# before_save
# around_save
# before_create
# around_create
# after_create
# after_save
# after_commit/after_rollback

# 3.2 Updating an Object
# before_validation
# after_validation
# before_save
# around_save
# before_update
# around_update
# after_update
# after_save
# after_commit/after_rollback

# 3.3 Destroying an Object
# before_destroy
# around_destroy
# after_destroy
# after_commit/after_rollback

# 'after_save' runs both on 'create' and 'update', 
# but always after the more specific callbacks after_create and after_update, 
# no matter the order in which the macro calls were executed.


# DEBUGGING CALLBACKS:
# ======================
# The callback chain is accessible via the _*_callbacks method on an object. 

# Active Model Callbacks support:
# :before, :after and :around, as values for the kind property:
# the *kind* property defines what part of the chain the callback runs in.

# EXAMPLE:
# ========
# 1. To find all callbacks in the "before_save" callback chain:

#  Topic._save_callbacks.select { |cb| cb.kind.eql?(:before) }

# => Returns an array of callback objects that form the before_save chain.

# 2. To further check if the "before_save" chain contains a proc defined as:
# "rest_when_dead", use the "filter" property of the callback object:

#   Topic._save_callbacks.select { |cb| cb.kind.eql?(:before) }.collect(&:filter).include?(:rest_when_dead)

# => Returns true or false, depending on whether the proc is contained in the "before_save" callback chain on a 
# Topic model.