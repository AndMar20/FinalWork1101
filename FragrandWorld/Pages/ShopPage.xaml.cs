using DataBaseLibrary.Models;
using DataBaseLibrary.Services;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace App.Pages
{
    /// <summary>
    /// Логика взаимодействия для ShopPage.xaml
    /// </summary>
    public partial class ShopPage : Page
    {
        private List<Product> Products { get; set; }

        private ProductService _service = new();

        private bool IsToggle;
        public ShopPage()
        {
            InitializeComponent();

            SearchTextBox.TextChanged += Filters_Changed;
            FromTextBox.TextChanged += Filters_Changed;
            ToTextBox.TextChanged += Filters_Changed;
            SortComboBox.SelectionChanged += Filters_Changed;
            ManufacturerComboBox.SelectionChanged += Filters_Changed;
        }

        private void ExitImage_MouseDown(object sender, MouseButtonEventArgs e)
        {
            App.Current.Resources["UserID"] = null;
            App.Current.Resources["UserName"] = null;
            App.Current.Resources["UserSurname"] = null;
            App.Current.Resources["UserPatronymic"] = null;
            App.Current.Resources["UserLogin"] = null;
            App.Current.Resources["UserPassword"] = null;
            App.CurrentFrame.Navigate(new AuthorizePage());
        }

        private async void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UserFullnameLabel.Content = $"{App.Current.Resources["UserSurname"].ToString()} " +
                                       $"{App.Current.Resources["UserName"].ToString()} " +
                                       $"{App.Current.Resources["UserPatronymic"].ToString()}";

            await FillManufacturerComboBoxAsync();
            await UpdateProductAsync();
        }

        private async void Filters_Changed(object sender, RoutedEventArgs e)
        {
            MainStackPanel.Children.Clear();
            await UpdateProductAsync();
        }
        public async Task FillManufacturerComboBoxAsync()
        {
            try
            {
                var manufacturers = await _service.GetManufacturersAsync();

                if (manufacturers != null)
                    foreach (var manufacturer in manufacturers)
                        ManufacturerComboBox.Items.Add(manufacturer);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex}");
            }
        }

        private async Task UpdateProductAsync()
        {
            try
            {
                decimal? fromCost = null;
                decimal? toCost = null;

                if (!string.IsNullOrWhiteSpace(FromTextBox.Text) && decimal.TryParse(FromTextBox.Text, out decimal parsedFromCost))
                    fromCost = parsedFromCost;

                if (!string.IsNullOrWhiteSpace(ToTextBox.Text) && decimal.TryParse(ToTextBox.Text, out decimal parsedToCost))
                    toCost = parsedToCost;


                Products = await _service.GetProductsAsync(
                SearchTextBox.Text,
                SortComboBox.SelectedIndex,
                fromCost.GetValueOrDefault(), // Если fromCost == null, будет использовано значение по умолчанию 0
                toCost, // Может быть null, это обрабатывается в методе GetProductsAsync
                ManufacturerComboBox.SelectedValue.ToString()
                );

                foreach (Product product in Products)
                    CreateProductContainer(product);
                countLabel.Content = $"Показано {Products.Count} из {await _service.GetProductsCountAsync()}";
            }
            catch (Exception ex)
            {
                    MessageBox.Show($"Ошибка: {ex}");
            }
        }

        private void CreateProductContainer(Product product)
        {
            Border border = new()
            {
                Height = 130,
                Background = new SolidColorBrush(Color.FromArgb(255, 224, 223, 223)),
                Margin = new Thickness(10)
            };

            StackPanel productStackPanel = new()
            {
                Margin = new Thickness(10),
                Tag = product.ArticleNumber,
            };

            Grid grid = new Grid();

            StackPanel stackPanel2 = new();

            Label nameProductLabel = new()
            {
                Content = product.Name,
                HorizontalAlignment = HorizontalAlignment.Left,
                FontSize = 16
            };

            Label manufacturerProductLabel = new()
            {
                Content = product.Manufacturer,
                HorizontalAlignment = HorizontalAlignment.Left,
                Foreground = new SolidColorBrush(Color.FromArgb(255, 152, 144, 144))
            };

            Label descriptionLabel = new()
            {
                Margin = new Thickness(0, -10, 0, 0),
                Content = product.Description,
                HorizontalAlignment = HorizontalAlignment.Left
            };

            StackPanel stackPanel3 = new()
            {
                Orientation = Orientation.Horizontal,
                Margin = new Thickness(0, -5, 0, 0),
            };

            Label textLabel = new()
            {
                Content = "Цена:",
                FontSize = 16
            };

            TextBlock CostTextBlock = new()
            {
                Text = product.Cost.ToString(),
                HorizontalAlignment = HorizontalAlignment.Left,
                VerticalAlignment = VerticalAlignment.Center,
                FontSize = 16,
                Foreground = new SolidColorBrush(Color.FromRgb(0, 0, 0))
            };

            Button addProductItemButton = new()
            {
                Content = "Заказать",
                Background = new SolidColorBrush(Color.FromRgb(166, 166, 166)),
                HorizontalAlignment = HorizontalAlignment.Right,
                VerticalAlignment = VerticalAlignment.Bottom,
                Width = 100,
                Height = 30,

            };

            MainStackPanel.Children.Add(border);
            border.Child = productStackPanel;

            productStackPanel.Children.Add(grid);
            grid.ColumnDefinitions.Add(new ColumnDefinition());
            grid.ColumnDefinitions.Add(new ColumnDefinition() { Width = GridLength.Auto });
            grid.ColumnDefinitions.Add(new ColumnDefinition() { Width = GridLength.Auto });

            grid.Children.Add(stackPanel2);
            stackPanel2.Children.Add(nameProductLabel);
            stackPanel2.Children.Add(descriptionLabel);
            stackPanel2.Children.Add(manufacturerProductLabel);
            stackPanel2.Children.Add(stackPanel3);

            stackPanel3.Children.Add(textLabel);
            stackPanel3.Children.Add(CostTextBlock);

            grid.Children.Add(addProductItemButton);
            Grid.SetColumn(addProductItemButton, 1);
        }
    }
}
