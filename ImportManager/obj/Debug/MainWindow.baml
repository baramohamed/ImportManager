   M S B A M L   `   `   `  ����H  DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View  5   	       ImportManager.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:ImportManager.View     5   	     � Title$  
MainWindow��5	   	    � WindowState$ 	Maximized=�6   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      .+�5   
   �� -   5         ��Name$ Content��5      $��1��6*   5      � 5   
      PrimaryHueMidBrush#��[  6   .+�5      �� -   5         �� SelectedIndex$ 0��5      ��5      �� *	MainPages+.@�5      �� .��5      ��  �� Orientation$ 
Horizontal=�6!   $	��Top=�5      .+�5      ��   HomeWhiteIcon#��[ 6    
�������$��70��5       �� 5      $��Accueil��6$   
�������$��Center=�5   $   $
��20,0q�5    $   $��30(�5!   $   5"      5#      �� 5$      .��5%      �� $ 
Horizontal=�6!   $	��Top=�5&   %   .+�5'      ��   FerryWhiteIcon#��[ 6    
�������$��70��5)      �� 5*      $��Importations��6$   
�������$��Center=�5,   $   $
��20,0q�5-   $   $��30(�5.   $   5/      50      �� 51      .��52      �� $ 
Horizontal=�6!   $	��Top=�53      .+�54      ��   PackageWhiteIcon#��[ 6    
�������$��70��56      �� 57      $��	Catalogue��6$   
�������$��Center=�59      $
��20,0q�5:      $��30(�5;      5<      5=      �� 5>      .��5?      �� $ 
Horizontal=�6!   $	��Top=�5@      .+�5A      ��   CalendarWhiteIcon#��[ 6    $��70��5B      �� 5C      $��
Echéances��6$   
�������$��Center=�5E      $
��20,0q�5F      $��30(�5G      5H      5I      �� 5J      .��5K      �� $ 
Horizontal=�6!   $	��Top=�5L      .+�5M      ��   SettingsWhiteIcon#��[ 6    $��70��5N      �� 5O      $��Paramètres��6$   
�������$��Center=�5Q      $
��20,0q�5R      $��30(�5S      5T      5U      5V      5W      5Y      5v      