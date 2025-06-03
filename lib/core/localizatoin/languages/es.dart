import 'package:ecommerceapp/core/constants/lang_keys.dart';

Map<String, String> esMap = {
  // main
  LangKeys.appTitle: "Mi Aplicación",
  LangKeys.offersTitle: "Ofertas",

  // onboarding
  LangKeys.chooseLanguage: "Elige tu idioma",
  LangKeys.arabic: "Árabe",
  LangKeys.english: "Inglés",
  LangKeys.germany: "Alemán",
  LangKeys.spain: "Español",
  LangKeys.chooseProduct: "Elige producto",
  LangKeys.onBoarding1: "Bienvenido a la aplicación",
  LangKeys.onBoardingTitle1: "Descubre todo lo que necesitas 🛍️",
  LangKeys.onBoardingTitle2: "Entrega rápida y segura 🚚",
  LangKeys.onBoardingTitle3: "Opciones de pago flexibles 💳",
  LangKeys.onBoardingBody1:
      "Explora miles de productos de todas \nlas categorías de forma fácil y segura.",
  LangKeys.onBoardingBody2:
      "Haz tu pedido y recíbelo en la puerta \nde tu casa en poco tiempo.",
  LangKeys.onBoardingBody3:
      "Paga como prefieras – con tarjeta, \ntransferencia o contra entrega.",

  LangKeys.next: "Siguiente",
  LangKeys.enter: "Entrar",

  // auth
  LangKeys.login: "Iniciar sesión",
  LangKeys.loginTitle: "Bienvenido de nuevo",
  LangKeys.loginSub: "Inicia sesión con tu correo y contraseña",
  LangKeys.signup: "Registrarse",
  LangKeys.signupTitle: "Únete ahora",
  LangKeys.signupSub: "Registra tu información",
  LangKeys.rememberMe: "Recuérdame",
  LangKeys.forgetPassword: "¿Olvidaste tu contraseña?",
  LangKeys.dontHaveAccount: "No tienes cuenta ? ",
  LangKeys.ifHaveAccount: "Si tienes una cuenta, ",
  LangKeys.email: "Correo electrónico",
  LangKeys.emailFieldHint: "Introduce tu correo",
  LangKeys.password: "Contraseña",
  LangKeys.passwordFieldHint: "Introduce tu contraseña",
  LangKeys.userName: "Nombre de usuario",
  LangKeys.userNameFieldHint: "Introduce tu nombre de usuario",
  LangKeys.phone: "Teléfono",
  LangKeys.phoneFieldHint: "Introduce tu número de teléfono",
  LangKeys.confirmPassword: "Confirmar contraseña",
  LangKeys.confirmHint: "Vuelve a introducir tu contraseña",
  LangKeys.emptyFieldError: "Este campo no puede estar vacío",
  LangKeys.minLengthError: "Longitud mínima no alcanzada",
  LangKeys.maxLengthError: "Se excedió la longitud máxima",
  LangKeys.checkYourEmail: "Revisa tu correo",
  LangKeys.check: "Verificar",
  LangKeys.returnTo: "Volver a",
  LangKeys.verificationCode: "Código de verificación",
  LangKeys.verificationSentence: "Introduce el código enviado a tu correo",
  LangKeys.continueButton: "Continuar",
  LangKeys.newPassword: "Nueva contraseña",
  LangKeys.resetPassword: "Restablecer contraseña",
  LangKeys.resetPasswordSentence: "Introduce una nueva contraseña",
  LangKeys.save: "Guardar",
  LangKeys.goLogin: "Ir a iniciar sesión",
  LangKeys.passChangedSuccess: "Contraseña cambiada con éxito",
  LangKeys.passChangedSuccessTitle: "Éxito",
  LangKeys.passChangedSuccessSub:
      "Su contraseña ha sido actualizada con éxito.",
  LangKeys.pcAuthText: """
      ¡Bienvenido de nuevo! 👋

Descubre una forma más inteligente de comprar.  
Miles de productos, experiencia fluida y entrega ultrarrápida, todo en un solo lugar.

Crea tu cuenta ahora y únete a una comunidad creciente de compradores inteligentes.

Tu próximo producto favorito está a solo un clic de distancia.
""",

  // homepage
  LangKeys.searchFieldHint: "Buscar producto...",
  LangKeys.specialForYou: "Especial para ti",
  LangKeys.seeAll: "Ver todo",
  LangKeys.categories: "Categorías",
  LangKeys.topSelling: "Más vendidos",
  LangKeys.offers: "Ofertas",
  LangKeys.cart: "Carrito",
  LangKeys.profile: "Perfil",
  LangKeys.settings: "Ajustes",

  // cart
  LangKeys.cartTitle: "Carrito",
  LangKeys.couponFiledHint: "Introduce código de cupón",
  LangKeys.apply: "Aplicar",
  LangKeys.checkoutButton: "Finalizar compra",
  LangKeys.cartTotal: "Total del carrito",
  LangKeys.deliveryCost: "Costo de envío",
  LangKeys.total: "Total",
  LangKeys.confirmRemoveFromCart:
      "Está de acuerdo en eliminar @itemName del carrito?",
  LangKeys.cartIsEmpty:
      "Tu carrito está vacío, por favor agrega algunos productos primero.",
  LangKeys.error: "Error",

  // checkout
  LangKeys.checkoutTitle: "Finalizar compra",
  LangKeys.deliveryMethod: "Método de entrega",
  LangKeys.delivery: "Entrega",
  LangKeys.receiveStore: "Recoger en tienda",
  LangKeys.address: "Dirección",
  LangKeys.paymentMethod: "Método de pago",
  LangKeys.cash: "Efectivo",
  LangKeys.creditCards: "Tarjetas de crédito",
  LangKeys.chooseDelivery: "Por favor elija método de entrega",
  LangKeys.chooseAddress: "Por favor elija dirección",
  LangKeys.choosePayment: "Por favor elija método de pago",
  LangKeys.done: "Hecho",
  LangKeys.orderSuccess: "El pedido se creó con éxito",
  LangKeys.tracking: "Seguimiento",

  // profile
  LangKeys.orders: "Pedidos",
  LangKeys.ordersSub: "Lista de tus pedidos",
  LangKeys.information: "Información",
  LangKeys.informationSub: "Actualiza tu información",
  LangKeys.addresses: "Direcciones",
  LangKeys.addressesSub: "Gestiona tus direcciones",

  // address
  LangKeys.choosingLocationTitle1: "Elegir ubicación",
  LangKeys.choosingLocationTitle2: "Selecciona tu ubicación exacta",
  LangKeys.addressName: "Nombre de la dirección",
  LangKeys.selectGov: "Selecciona gobernación",
  LangKeys.selectCity: "Selecciona ciudad",
  LangKeys.streetName: "Nombre de la calle",
  LangKeys.add: "Agregar",

  // orders
  LangKeys.pendingOrders: "Pedidos pendientes",
  LangKeys.orderNumber: "Número de pedido",
  LangKeys.totalPrice: "Precio total",
  LangKeys.status: "Estado del pedido",
  LangKeys.details: "Detalles",
  LangKeys.delete: "Eliminar",
  LangKeys.archiveOrders: "Pedidos archivados",
  LangKeys.pendingAwait: "Pendiente",
  LangKeys.approved: "Aprobado",
  LangKeys.onTheWay: "En camino",
  LangKeys.prepared: "Preparado",
  LangKeys.archived: "Archivado",
  LangKeys.orderDetails: "Detalles del pedido",
  LangKeys.price: "Precio",
  LangKeys.quantity: "Cantidad",
  LangKeys.item: "Artículo",

  // settings
  LangKeys.settingsTitle: "Configuraciones",
  LangKeys.language: "Idioma",
  LangKeys.languageSub: "Elige tu idioma preferido",
  LangKeys.notification: "Notificaciones",
  LangKeys.notificationSub: "Gestiona notificaciones",
  LangKeys.theme: "Tema",
  LangKeys.themeSub: "Elige el tema de la app",
  LangKeys.aboutUs: "Sobre nosotros",
  LangKeys.aboutUsSub: "Información sobre la aplicación",
  LangKeys.contactUs: "Contáctanos",
  LangKeys.contactUsSub: "Agradecemos tus comentarios",
  LangKeys.logOut: "Cerrar sesión",
  LangKeys.logOutSub: "Cerrar sesión de la aplicación",

  // dialog
  LangKeys.warn: "Advertencia",
  LangKeys.deleteConfirmMsg:
      "Estás seguro de que quieres eliminar este elemento?",
  LangKeys.ok: "OK",
  LangKeys.cancel: "Cancelar",
  LangKeys.confirm: "Confirmar",
  LangKeys.logoutConfirmMsg: "¿Deseas cerrar sesión?",
  LangKeys.exitMsg: "Deseas salir?",
  LangKeys.exit: "Salir",
};
