   M S B A M L   `   `   `  ����H  DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View  5      c6clr-namespace:Expression.Blend.SampleData.Importations(Expression.Blend.SampleData.Importations  5      )    #ImportManager.View.ImportationsPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ImportManager.View     5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      G
SampleData6clr-namespace:Expression.Blend.SampleData.Importations  5      V RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nullFMaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5	        � 	Resources  5         ImportationsItemTemplate �� Padding � ColumnDefinitions �� Orientation 
 Title2 �� StringFormat��%�  &	        7  7  7  7  7  7  7  �� 5   
   .R�5      �� $��0,0,0,1q�6   
���   �$ 5q�5      ._�5      �  5      �� 5      $
��Auto �6+   �� 5      $��* �6+   .+�5      �� $
��Left=�6!   .+�5      �� $ 
Horizontal=�6%   .+�5      �� $��N° Import: ��6(   8��  $
��10,0q�5   (   �� 5      8�� $
��10,0q�5   (   ��5   (   �� *	NumImport+5   (   5      �� 5       $ 
Horizontal=�6%   .+�5!      �� $��Date: ��6(   8�� $
��10,0q�5#   (   �� 5$      8�� $
��10,0q�5&   (   ��5$   (   �� *DateCreation+$ {0:dd/MM/yyyy}��5&   (   5'      �� 5(      $ 
Horizontal=�6%   .+�5)      �� $��Fournisseur: ��6(   $
��10,0q�5*   (   8�� 5+   (   �� 5,      $
��10,0q�5-   (   8�� ��5,   (   �� *Fournisseur.Denomination+5.   (   5/      50      �� 51      $��1��6    $��Right=�53       $��Center=�54       8�� ��52       �� *
Avancement+55       5e      5f      5g      5h      .��5l   
   � .+�5m      � y�6   �� *IsImportationsListVisible+   BooleanToVisibilityConverter �� 	Converter# [  � RowDefinitions 5n      �� 5o      $
��Auto �6    �� 5p      .+�5r      �� $ 
Horizontal=�6   $��Right=�5s      $	��Top=�5t      .+�5u      ��   	CloseIcon#��[ 6     
IconButton#��[ 5w      ��5v      �� *DeleteImportation+5w      �� 5x        SettingsIcon#��[ 6   #��[ 5z      ��5y      �� *ShowImportation+5z      �� 5{        PlusIcon#��[ 6   #��[ 5}      ��5|      �� *AddImportation+5}      5~      �� 5�      $��1��6   .��5�      �� -   5         ��Name$ listBox��5�      #���   5�      $��Stretch=�5�      ��5�      �� *Importations+ �� SelectedItem 5�      �� *SelectedImportation+.  (System.Windows.Interactivity.Interaction	   Triggers	 5�      /  )System.Windows.Interactivity.EventTrigger  5�      
   	EventName$
 MouseDoubleClick��6-   .  (System.Windows.Interactivity.TriggerBase   Actions. 5�   "   6  0System.Windows.Interactivity.InvokeCommandAction     Command 68   �� *ShowImportation+5�      5�      5�      5�      � 5�      $��10q�6   y�5�      �� *IsImportationSelected+# [  �� FallbackValue$ 	Collapsed��.+�5�      �� $��10q�6   $
��Left=�5�      $	��Top=�5�       K� ZIndex$ 1��5�      ��5�      �� *HideImportation+.��5�      ��   LeftArrowWhiteIcon#��[ 6   5�      � 5�       � DataContext 6   �� *SelectedImportation+.+�5�      (   "ImportManager.View.ImportationPage  5�      5�      5�      5�      