using DataBaseLibrary.Models;
using DataBaseLibrary.Services;
using System.Windows;
using System.Windows.Controls;
namespace FragrandWorldApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizePage.xaml
    /// </summary>
    public partial class AuthorizePage : Page
    {
        private UserService _service = new();
        public AuthorizePage()
        {
            InitializeComponent();
        }

        private async void authorizationButton_Click(object sender, RoutedEventArgs e)
        {

            if (await _service.IsUserExistAsync(loginTextBox.Text, passwordBox.Password))
            {
                User user = await _service.GetUserByLoginAsync(loginTextBox.Text);
                AcceptUserData(user);
                App.CurrentFrame.Navigate(new ShopPage());


            }
            else
            {
                MessageBox.Show("логин или пароль введены неверно.",
                                "сообщение",
                                MessageBoxButton.OK,
                                MessageBoxImage.Error);
            }
        }

        private void AcceptUserData(User user)
        {
            App.Current.Resources["UserID"] = user.UserId;
            App.Current.Resources["RoleID"] = user.RoleId;
            App.Current.Resources["UserName"] = user.Name;
            App.Current.Resources["UserSurname"] = user.Surname;
            App.Current.Resources["UserPatronymic"] = user.Patronymic;
            App.Current.Resources["UserLogin"] = user.Login;
            App.Current.Resources["UserPassword"] = user.Password;
        }
        private void guestButton_Click(object sender, RoutedEventArgs e)
        {
            User user = new();
            AcceptUserData(user);

            App.CurrentFrame.Navigate(new ShopPage());
        }
    }
}
