   M S B A M L   `   `   `  ����I  ETBBTPlayert0.5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:TBBTPlayert0._5.WindowsTBBTPlayert0._5.Windows  5   	   *    $TBBTPlayert0._5.Windows.WinUserLogin   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:TBBTPlayert0._5.Windows     5   	     � Title$  Авторизация��5   	   $	��250��6   $	��260��6*    � WindowStyle$
 None=�68    � AllowsTransparency . 
������  � WindowStartupLocation$ CenterScreen=�6    � 
ResizeMode$ NoResize=�6�   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6   .+�5   
   �� $��3��6   ���#7F614566   �� 5   
   -   5         ��Name$ RegisterLab��5      $��Введите логин��6%   $��0��6>   $��23(�6K   $��Center=�6Y   $��Center=�6v   6�   �� 5   
   -   5         ��Name$ LoginTB��5      $��1��6#   $	��175��60   $��40��6<   ���#c9ab8f$��0q�6]   $	��Top=�6q   $��23(�6�   $��Center=�6�   .��6�    � 	Resources 5      	 �� 
TargetType
 �� Property �� Value��%_   '��       �� 5      "	 ��6   .�5      �� 
 �@��CornerRadius$ 10��65   5      5      .��6!   5      �� 5   
   -   5         ��Name$ EnterBut��5      $��Продолжить��6#   ���#3d2e1b���#efe5d3$��2��6b   $	��175��6o   $��40��6{   $��23(�6�   $��0q�6�   $	��Top=�6�    5      ��%_   '��       �� 5      "	 ��6   .�5      �� 
 �@��CornerRadius$ 10��65   5      5      5      �� 5    
   -   5        $ BRegistr��5       $��Регистрация��6$   $��2��6;   $	��175��6H   $��40��6T   $��23(�6`   $��Bottom=�6n   ���#7F6145$��0q�6�    5!      ��%_   '��       �� 5"      "	 ��6   .�5#      �� 
 �@��CornerRadius$ 10��65   5$      5%      5&      �� 5'   
   -   5        $ BCloseRegWin��5'      $��50��6'   $��20��62   $	��Top=�6>   $��Right=�6V   
���\\��6�   5(      5)      