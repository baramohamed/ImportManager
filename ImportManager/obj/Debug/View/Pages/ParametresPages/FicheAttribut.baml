   M S B A M L   `   `   `  ����V  RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf  5       ImportManager&    ImportManager.View.FicheAttribut   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      cMaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5      .��5	      �� .+�5
   
   �� -   5        $��designation��5      )   #MaterialDesignThemes.Wpf.HintAssist    Hint$  Désignation FR��5
      ��5      �� *DesignationFR+�� 5   
   $  Désignation AR��6   ��5      �� *DesignationAR+�� 5   
   $  Désignation EN��6   ��5      �� *DesignationEN+�� 5   
   -   5         ��Name$
 pere��5      $  Dépendance��5       �� DisplayMemberPath$ DesignationFR��5      ��5      �� *Peres+ �� SelectedItem 5      �� *Pere+5      �� 5   
   $ ValeurFR��5        5      ��  �� ElementName$
 pere�� �� Path$  SelectedItem.DesignationFR� �� StringFormat$ Choisir une {0}����5      �� *ValeursPere+ 5      �� *SelectedValeurPere+y�5      �� *IsPereSelected+    BooleanToVisibilityConverter �� 	Converter# [  �� 5   
    �� Orientation$ 
Horizontal=�6   $��Right=�5      .+�5       ��   	CloseIcon#��[ 6     
IconButton#��[ 5"      ��5!      �� *DeleteValeur+5"      �� 5#        PlusIcon#��[ 6   #��[ 5%      ��5$      �� *	AddValeur+5%      5&      &   System.Windows.Controls.DataGrid  5'   
   	   AutoGenerateColumns	 .  $��Center=�5(      
   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$	
 120 5)         CanUserAddRows .     CanUserDeleteRows .  $��10q�5.      ��5*      �� *	Valeurs+ 5+      �� *SelectedValeur+   Columns 5/      0  *System.Windows.Controls.DataGridTextColumn  50      ,  &System.Windows.Controls.DataGridColumn   Header$	 N°��6%     51      1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *
ValeurFR+ 52      �� 53      ��6$   �� $ designation��$
 Text�$ {0} FR��55        56       6%   �� *
ValeurEN+ 57      �� 58      ��6$   �� $ designation��$
 Text�$ {0} EN��5:        5;       6%   �� *
ValeurAR+ 5<      �� 5=      ��6$   �� $ designation��$
 Text�$ {0} AR��5?      5A      5B      5C      