   M S B A M L   `   `   `  ����I  ETBBTPlayert0.5, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:TBBTPlayert0._5.WindowsTBBTPlayert0._5.Windows  5   	   '    !TBBTPlayert0._5.Windows.WinPlayer   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   7local%clr-namespace:TBBTPlayert0._5.Windows     5   	     � Title$  	WinPlayer��5   	   $	��450��6   $	��800��6(   ���#AD713B � WindowStartupLocation$ CenterScreen=�6I   .��5	      �  � RowDefinitions 5
   
   �� 5      $��6* �6   �� 5       � ColumnDefinitions 5   
   �� 5      $
��0.1* �6   6.   �� 5      6!   �� 5      $��5* �6   6,   �� 5      6!   �� 5      $
��0.1* �6   6.   .+�5   
   r� -   5         r�Name$ PlayerMedia��5      $	��750��6,   $	��Top=�69   $��0��6Q   $��1��6^   $��3��6n    r� LoadedBehavior$ Manual=�6�    r� Source$) #\Resourses\Video\Трейлер.mp4?�6�   �� 5   
   -   5         ��Name$ PausePlayBut��5      $��1��6'   $	��▶��67   ���#33251A���#c9ab8f$��37��6m   $��37��6y   $��Center=�6�   $��1��6�   $
��Left=�6�   $
��20,0q�6�    � 	Resources 5      	 �� 
TargetType
 �� Property �� Value��%_   '��       �� 5      "	 ��6   .�5      �� 
 �@��CornerRadius$ 15��65   5      5      5      �� 5    
   -   5         ��Name$ valueSli��5       $��1��6#   $��3��60   ���#c9ab8f$��Right=�6U   $��Center=�6q   $	��100��6�    � Maximum$ 1Q�6�    � Minimum$ 0Q�6�    � SmallChange$
 0.05Q�6�   6�   �� 5!   
   -   5        $ PlayerControl��5!      $��1��6(   $��2��65   ���#c9ab8f$��Center=�6Z   $��Center=�6w   $ 1Q�6�   $	��550��6�   $ 0Q�6�   6�   5#      5$      