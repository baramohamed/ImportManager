   M S B A M L   `   `   `  ����V  RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf  5       ImportManager&    ImportManager.View.CataloguePage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      cMaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5      .��5
      �   � ColumnDefinitions  5   
   �� 5      $��4* �6   �� 5      $��2* �6   .+�5   
   �� .+�5      ��  �� Orientation$ 
Horizontal=�6   $��Right=�5      .+�5      �� $��Auto Remplissage��6      
IconButton#��[  5      ��5      �� *GenerateCatalogue+5      �� 5        	CloseIcon#��[ 6   #��[  5      ��5      �� *DeleteArticle+5      �� 5        SettingsIcon#��[ 6   #��[  5      ��5      �� *EditArticle+5      �� 5        PlusIcon#��[ 6   #��[  5      ��5      �� *
AddArticle+5      5      &   System.Windows.Controls.DataGrid  5       ��6   �� *
Produits+5"        5#         CanUserAddRows .     CanUserDeleteRows .     AutoGenerateColumns .  $��20q�5(      ��5#      �� *
Articles+ �� SelectedItem 5&      �� *SelectedArticle+   Columns 5)      0  *System.Windows.Controls.DataGridTextColumn  5*      ,  &System.Windows.Controls.DataGridColumn   Header$ Référence��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5+   %   �� *	Reference+  5,      $ Désignation��6)   	   MinWidth$		 300Q�5-   %    5.   %   �� *Designation+  5/      $ Numéro O.E.M��6)    50   %   �� *OEM+  51      $ 	Poids net��6)    52   %   �� *
PoidsNet+  53      $ Volume en CBM��6)    54   %   �� *Volume+  55      $ 	Packaging��6)    56   %   �� *Packaging.Designation+58      59      �� 5:   
   $��5��6   �� 5;   
   $��1��6   {�6%   �� *IsEditEnabled+.+�5<      �� )   #MaterialDesignThemes.Wpf.HintAssist
   Hint$
 Référence��6   ��6A   �� *SelectedArticle.Reference+�� 5=      $
 Désignation��6   ��6C   �� *SelectedArticle.Designation+�� 5>      $
 O.E.M��6   ��6=   �� *SelectedArticle.OEM+�� 5?      $
 	Poids Net��6   ��6A   �� *SelectedArticle.PoidsNet+�� 5@      $
 Volume en CBM��6   ��6E   �� *SelectedArticle.Volume+�� 5A      $
 	Packaging��6    �� DisplayMemberPath$ Designation��6�   ��6B   �� *
Packagings+ 6e   �� *SelectedArticle.Packaging+6�   �� 5B      $��OK��6   $��Right=�6@   $��40,10q�6\   ��6"   �� *	OkCommand+6\   5C      5D      5E      