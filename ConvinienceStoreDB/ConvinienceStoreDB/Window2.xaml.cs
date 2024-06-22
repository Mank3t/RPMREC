using System.Data.SqlClient;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Security.Cryptography.X509Certificates;
using System.Windows.Documents;
using System;

namespace ConvinienceStoreDB
{
    /// <summary>
    /// Логика взаимодействия для Window2.xaml
    /// </summary>
    public partial class Window2 : Window
    {

        public Window2()
        {
            InitializeComponent();


            DataTable dt_LoadCol = LoadColTab("SELECT Color.Title FROM Color");
            DataTable dt_LoadManufact = LoadManfctTab("select Manufacturer.Title from Manufacturer");
            DataTable dt_LoadProdType = LoadProdTypeTab("select Product_Type.Title from Product_Type");

        }

        DataTable LoadColTab(string selectSQL)
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

                    var a = reader.GetValue(0);
                    a = a.ToString();
                    CbColorAdd.Items.Add(a);
                }

            }
            else
            {
                MessageBox.Show("Предмет не найден");
            }
            sqlConnection.Close();
            return dataTable;

        }

        DataTable LoadManfctTab(string selectSQL)
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

                    var a = reader.GetValue(0);
                    a = a.ToString();
                    CbManufacturerAdd.Items.Add(a);
                }

            }
            else
            {
                MessageBox.Show("Предмет не найден");
            }
            sqlConnection.Close();
            return dataTable;
        }

        DataTable LoadProdTypeTab(string selectSQL)
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

                    var a = reader.GetValue(0);
                    a = a.ToString();
                    CbProdTypeAdd.Items.Add(a);
                }

            }
            else
            {
                MessageBox.Show("Предмет не найден");
            }
            sqlConnection.Close();
            return dataTable;
        }



        private void BCloseAddNewPRod_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }



        private void AddProduct()
        {
         
            string sql = "INSERT INTO Products (Article, Title, ID_Product_Type, ID_Color, ID_Manufacturer, Desrcription, Price) VALUES (@Article, @PRodTitle, @IdProdType, @IdProdCol, @IdProdManuf, @ProdDescript, @Price) ";
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-NN9BAS1\SQLEXPRESS;initial catalog=Convinience_Store;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;"))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
              

                try
                {
                    conn.Open();

                    

                    cmd.Parameters.AddWithValue("@Article", TbAddArticle.Text);
                    cmd.Parameters.AddWithValue("@PRodTitle", TbAddTitle.Text);
                    cmd.Parameters.AddWithValue("@IdProdType",Convert.ToInt32(CbProdTypeAdd.SelectedIndex + 1));
                    cmd.Parameters.AddWithValue("@IdProdCol", Convert.ToInt32(CbColorAdd.SelectedIndex + 1));
                    cmd.Parameters.AddWithValue("@IdProdManuf", Convert.ToInt32(CbManufacturerAdd.SelectedIndex + 1));
                    cmd.Parameters.AddWithValue("@ProdDescript", TbAddDescr.Text);
                    cmd.Parameters.AddWithValue("@Price", TbPrice.Text);
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Выполненно");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
                finally 
                { 
                    conn.Close();
                }
            }
            
        }


    

        private void BAddNewProd_Click(object sender, RoutedEventArgs e)
        {
            AddProduct();
        }
    }
}



