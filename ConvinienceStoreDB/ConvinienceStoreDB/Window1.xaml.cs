using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows;


namespace ConvinienceStoreDB
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
            
        }

        public class Selection 
        {
        
        }

        private void BSearch_Click(object sender, RoutedEventArgs e)
        {
            if (TbArticleSearch.Text.Length > 0)
            {
                DataTable dt_Search = Searchfor("select Products.Article, Products.Title, Products.Price, Products.Desrcription, Product_Type.Title, Color.Title, Manufacturer.Title  from Products  join Manufacturer on Products.ID_Manufacturer = Manufacturer.ID_Manufacturer join Product_Type on  Products.ID_Product_Type = Product_Type.ID_Product_Type  Join Color on Products.ID_Color = Color.ID_Color and Article =  '" + TbArticleSearch.Text + "'");
           
            }
            else
            {
                MessageBox.Show("Введите Артикул");
            }

   
        }
        DataTable Searchfor(string selectSQL)
        {
         
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(@"Data Source=DESKTOP-NN9BAS1\SQLEXPRESS;initial catalog=Convinience_Store;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;");
            sqlConnection.Open();
            SqlCommand sqlCommandSearch = new SqlCommand(selectSQL, sqlConnection);
            SqlDataReader reader = sqlCommandSearch.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    var Article = reader.GetValue(0);
                    var Title = reader.GetValue(1);
                    var Price = reader.GetValue(2);
                    var Description = reader.GetValue(3);
                    var PrType = reader.GetValue(4);
                    var Color = reader.GetValue(5);
                    var Manufacturer = reader.GetValue(6);

                    TbArtile.Text = Article.ToString();
                    TbTitle.Text = Title.ToString();
                    TbPrice.Text = Price.ToString();
                    TbPrType.Text = PrType.ToString();
                    TbDescript.Text = Description.ToString();
                    TbColor.Text = Color.ToString();
                    TbManufact.Text = Manufacturer.ToString();

                }

            }
            else 
            {
                MessageBox.Show("Предмет не найден");
            }
            sqlConnection.Close();
            return dataTable;
        }
        DataTable DeleteInfo(string selectSQL) 
        {
            DataTable dataTable = new DataTable();
            SqlConnection sqlConnection = new SqlConnection(@"Data Source=DESKTOP-NN9BAS1\SQLEXPRESS;initial catalog=Convinience_Store;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;");
            sqlConnection.Open();
            try
            {
                SqlCommand sqlCommanDdel = new SqlCommand(selectSQL, sqlConnection);
                int i =  sqlCommanDdel.ExecuteNonQuery();
                MessageBox.Show($"Удаленых строк - {i} ");
            }
            catch(Exception) 
            {
                MessageBox.Show("Проверьте введённый Артикул");
            }
            
            return dataTable;

        }



            private void BDelete_Click(object sender, RoutedEventArgs e)
            {
            
                 if (TbArticleDelete.Text.Length > 0) 
                 {
                   DataTable dt_Delete = DeleteInfo("delete from Products where Products.Article = " + TbArticleDelete.Text);
                 }
                else
                {
                   MessageBox.Show("Введите Артикул");
                }
            }


        private void BaddTov_Click(object sender, RoutedEventArgs e)
        {
            Window2 addtov = new Window2();
            addtov.ShowDialog();
        }
    }
}


