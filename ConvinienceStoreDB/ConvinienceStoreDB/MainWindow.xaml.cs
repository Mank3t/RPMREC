using System.Data;
using System.Data.SqlClient;
using System.Windows;

namespace ConvinienceStoreDB
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BLogIn_Click(object sender, RoutedEventArgs e)
        {
            if (TbLogin.Text.Length > 0)
            {
                if (TbPAssword.Text.Length > 0)
                {
                    DataTable dt_user = Select("SELECT * FROM [dbo].[UserLogin] WHERE [UserName] = '" + TbLogin.Text + "' AND [UserPassword] = '" + TbPAssword.Text + "'");
                    if (dt_user.Rows.Count > 0)
                    {                       
                        Window1 InitComplete = new Window1();
                        this.Close();
                        InitComplete.ShowDialog();
                    }
                    else
                    {
                        MessageBox.Show("Пользователь не найден");
                    };

                }
                else
                {
                    MessageBox.Show("Введите пароль");
                }
            }
            else 
            {
                MessageBox.Show("Введите логин");
            }
        }
        DataTable Select(string selectSQL) 
        {
            DataTable dataTable = new DataTable("Database");
            SqlConnection sqlConnection  = new SqlConnection(@"Data Source=DESKTOP-NN9BAS1\SQLEXPRESS;initial catalog=Convinience_Store;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework;");
            sqlConnection.Open();
            SqlCommand sqlCommand = sqlConnection.CreateCommand();
            sqlCommand.CommandText = selectSQL;
            SqlDataAdapter sqldataAdapter = new SqlDataAdapter(sqlCommand);
            sqldataAdapter.Fill(dataTable);
            return dataTable;
        }

    }
}
