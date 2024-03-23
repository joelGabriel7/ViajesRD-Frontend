/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

/// Switch of Custom Brand-Text-Size Widget
enum TextSizes { small, medium, large }

enum OrderStatus { processing, shipped, delivered }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

enum UserRole { agency, client }

enum UserStatus { active, deactive }

enum AuthStatus { authenticated, unauthenticated, isLoading }
