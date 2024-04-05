  It Start from SRC Folder:
  in which there is the Data ,Presentation ,Application and Domain Layer is is followed.

 " Application Layer:"
  1) Navigate class provides methods for navigating app, including navigation, replacing screens, and popping screens.
  2) Picker Services to contains a method pickImage() which used FilePicker to pick image.

   "Data Layer:"
  1) AppData:

     The AppInitializer mixin sets the app by registering services and initializing user data using shared preferences.
     then by handling user login data retrieval and token.
     The AppMedia mixin provides  getters for device width, height and text scale factor using MediaQueryData.
     Having Methods for requesting and checking permissions such as media access, notifications, storage, and camera access using the permission_handler package.
     SharedPrefs class manages data stored in shared preferences, including user login data and tokens, and provides methods for initialization, data accesing and storage.
     In App provider screen there is the list of provider are place in one file.
     The Data class is like a container that holds all functions for set the app, managing user data, and handling themes.
     It provides a single access point, app, for using these tools across the app.
     UserData mixin defines properties for user token and user data.
     It provides setter methods and getter methods, in simple management of user's data in the App.
 
  2) DataSource/Resources Folder having Extensions and Utils/Contants for the App:

    Extension methods for num and int types.
    The CustomSizedBoxExt extension create SizedBox widgets with width and height.
    The Responsive Extension is used to explain the process of making responsive UIs across mobile devices.
    In the Api Constant class there will be the Constant Strings for Api url.
    and also in the Resources we place all the resources(imports , Colors, validator ,TextStyles, String and Assets etc) which is used in the app.

   "Domain Layer:"
 1) UserModel represents a user with properties.
    It provides methods for converting user data to and from JSON format.
 2) TodoItem class represents a to-do item with a title and an optional image path.

     
  "Presentation Layer:"
 1) Commons
    In Commons Folder we have AppText for the text for whole app 
    Custom textfield with Nullable Properties
    Flutter classes DisplayFileImage and DisplayFile show UI components for displaying file images and file information.
    MethodWidgets class provides methods for showing error snack bars, toast messages, creating buttons, dropdowns, menus, and dialogs in a App.
    
 2) Widgets
    Widget folder is used for screen UI  having Auth and Dasboard Components
    UserForm screen is for taking user input for name and email.
    On submission, it creates a UserModel object from the input data, saves it using SharedPreferences, and navigates to the TodoHome screen.
    The UserModel class represents a user with properties like ID, name, and email, giving methods.
    TodoHome providing features for managing todo tasks.
    It displays the user's name and floating action button for adding new to-do items.
    The body consists of a list of to-do items displayed using a ListView, with each item contained in a TodoContainer widget, for management of tasks.
    TodoContainer show to-do item's title and image with dismissible functionality for item deletion.
    It use Dismissible widget to enable swipe-to-dismiss functionality for removing to-do items.
    DisplayFileImage widget, allow user to delete the image with a tap.
    The onDeleteTap is handle deletion of the to-do item's image when tapped.
    The ValueListenableBuilder see for changes in the list of to-do items and updates the UI.
    TodoController class manages a ValueNotifier containing a list of TodoItem objects.
    The removeItem method allows for the removal of to-do items from the list.
        

 App Flow:
   The main(){} function starts the app.
   MyApp is main container for the app, having feathurs and initial screen.
   MaterialApp is the app show on the screen, starting with the UserForm Screen.
   Here is the Login form for collecting user information like name and email.
   It utilizes text controllers to accept input data from text fields.
   when form submitted, it creates a UserModel object with the entered name and email.
   The UserModel class used user data and provides methods to serialize and deserialize JSON.
   then it uses a shared preferences to store user data locally.
   On successful, it navigate to the TodoHome screen using navigator service class.
   The UserModel class provides methods to convert user data to and from JSON.
   The form ensures that both name and email fields are filled before submission.
   Error handling for empty fields is to fill the required field.
 