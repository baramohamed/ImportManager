   M S B A M L   `   `   `  ����V  RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf  5      H DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View 5      E ADragablz, Version=0.0.3.203, Culture=neutral, PublicKeyToken=null5(clr-namespace:Dragablz;assembly=DragablzDragablz 5      (   "ImportManager.View.NegociationPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      cMaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5      2local clr-namespace:ImportManager.View     5      =dragablz(clr-namespace:Dragablz;assembly=Dragablz     5        � 	Resources  5         CommandeDataTemplate(  "ImportManager.View.CommandeControl  OffreDataTemplate%  ImportManager.View.OffreControl  FactureProformaDataTemplate/  )ImportManager.View.FactureProformaControl0 *ImportManager.View.FactureTemplateSelector  FactureTemplateSelector��%�   &	        &	 (     &	 P     &	 x     �� 5   
   .R�5        5      �� 5   
   .R�5        5      �� 5   
   .R�5        5        5   
   6(   5      .��5      ]� .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $	��Top=�5      .+�5      ��   
IconButton#��[ 5      $
��15,5q�5      ��5      �� *AddCommande+.��5      �� $ 
Horizontal=�6   .+�5       ��   PlusIcon#��[ 6   $��0q�5!      �� 5"      $��Commande��6    $��Center=�5#       5$      5%      �� 5&      #��[ 5'      $
��15,5q�5(      ��5&      �� *
AddOffre+.��5)      �� $ 
Horizontal=�6   .+�5*      �� #��[ 6   $��0q�5+      �� 5,      $��Offre��6    $��Center=�5-       5.      5/      �� 50      #��[ 51      $
��15,5q�52      ��50      �� *Delete+.��53      �� $ 
Horizontal=�6   .+�54      ��   	CloseIcon#��[ 6   $��0q�55      �� 56      $��	Supprimer��6    $��Center=�57       58      59      5:        Dragablz.TabablzControl  5;   
   $��Stretch=�6"   $	��400��5<   "    �� ContentTemplateSelector# [ 5>   "   ��5=   "   �� *
Factures+ �� SelectedItem 5?   "   �� *SelectedFacture+5A      5B      