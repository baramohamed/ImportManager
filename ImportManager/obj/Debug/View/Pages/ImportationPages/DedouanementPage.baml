   M S B A M L   `   `   `  ����H  DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View  5      V RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf 5      )    #ImportManager.View.DedouanementPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ImportManager.View     5      cMaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5        � 	Resources  5
       �� 
TargetType �� Property �� Value��%�   '��       �� 5   
   " ��6   .�5      ��  � ��$ 18(�6)   �� 5       � ��$ 50��6'   �� 5       � ��$ Center=�62   5      5      .��5      )  #MaterialDesignThemes.Wpf.DialogHost     IsOpen 6    �� *IsDialogOpen+   DialogContent 5   
   �� 5      $��Bottom=�6   .+�5      ��    FileTemplate#��[  5      ��5      �� *
Fichiers+��5      �� 5      .R�5      � $	��600��6(   $	��500��5   (   $��10q�5   (   5      5      � 5       � ColumnDefinitions 5      �� 5       �� 5!      .+�5#      �� $��
Ajouter...��6   ��5$      �� *AjouterFichier+�� 5&      $��Fermer��6   $��1��5'      ��5(      �� *CloseDialog+5)      5*      .��5,   
   �� $��10q�6   .+�5-      � .+�5.      �� $��Droits Douaniers (D10)��6   $��25(�5/      $��Center=�50      $
��Left=�51      $��10q�52      �� 53        
IconButton#��[ 6     PaperClipIcon#��[ 55      $��Right=�56      $��50��57      ��54      �� *
OpenDialog+57      58      � 59      $��10q�6    5:      �� 5;      �� 5<      �� 5=      $
��Auto �6'   .+�5?      �� $��0��6   .+�5@      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Choisir Transitaire��6    �� DisplayMemberPath$ Denomination��5C      ��5A      �� *Transitaires+	 �� SelectedItem	 5B      �� *	Transit+5C      �� 5D      $ Cours:��6   ��5E      �� *CoursDedouanement+
 �� StringFormat$
 {0:N6}��5F      �� 5G      $��1��6   .+�5H      �� $ Montant Facture:��6   ��5I      �� *MontantFacture+$
 {0:N2}���� 5J      $ Montant Fret:��6   ��5K      �� *MontantFret+$
 {0:N2}���� 5L      $ Montant Assurances:��6   ��5M      �� *MontantAssurances+$
 {0:N2}���� 5N      $ Autres Frais:��6   ��5O      �� *MontantFrais+$
 {0:N2}���� 5P      $��20(�5Q      ��5P       �� *
ValeurDA+$
 Valeur en DA : {0:N2}��5Q      5R      �� 5S      $��3��6   .+�5T      �� $ Devise��6   $
 Code��5W      ��5U      �� *	Devises+	 5V      �� *DeviseFacture+5W      �� 5X      $ Devise��6   $
 Code��5[      ��5Y      �� *	Devises+	 5Z      �� *
DeviseFret+5[      �� 5\      $ Devise��6   $
 Code��5_      ��5]      �� *	Devises+	 5^      �� *DeviseAssurances+5_      �� 5`      $ Devise��6   $
 Code��5c      ��5a      �� *	Devises+	 5b      �� *DeviseFrais+5c      5d      5e      �� 5f      $��10q�6   .+�5g      &   System.Windows.Controls.DataGrid  $	��300��5h         AutoGenerateColumns .     ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$	 120 5j      $	��0.8q�5k      ��5l      �� *Taxes+   Columns 5m      0  *System.Windows.Controls.DataGridTextColumn  5n      ,  &System.Windows.Controls.DataGridColumn   Header$ Réf Fournisseur��6-   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6F   �� *	Reference+  5o      $ Désignation��6-      Width$	 200 6B    6N   �� *Designation+  5p      $ 	Quantité��6-    6?   �� *
Quantite+  5q      $ 
Prix Achat��6-    6A   �� *
PrixUnit+$
 {0:N2}��  5r      $ Assiette��6-    6?   �� *
Assiette+$
 {0:N2}��  5s      $	 D.D��6-    6:   �� *	MontantDD+$
 {0:N2}��  5t      $ T.C.S��6-    6<   �� *
MontantTCS+$
 {0:N2}��  5u      $ T.V.A��6-    6<   �� *
MontantTVA+$
 {0:N2}��5w      � 5x       5y      �� 5z      �� 5{      $	��480 �6+   .+�5}      �� $ Redevances (RPS,RUS,...)��6   $
��Left=�5      $��0��5�      $	��250��5�      ��5~      �� *TotalRedevances+$
 {0:N2}��5�      � 5�      $��1��6    5�      �� 5�      �� 5�      �� 5�      �� 5�      .+�5�      �� $��Total:��6$   �� 5�      $��1��5�      ��5�   $   �� *	TotalDD+$
 {0:N2}��5�      �� 5�      $��2��5�      ��5�   $   �� *
TotalTCS+$
 {0:N2}��5�      �� 5�      $��3��5�      ��5�   $   �� *
TotalTVA+$
 {0:N2}��5�      5�      5�      � 5�      $	��240��6   $��Right=�6#    5�      �� 5�      �� 5�      .+�5�      �� $��Total Taxes:��6    �� 5�      $��1��5�      ��5�       �� *
TotalTaxes+$
 {0:N2}��5�      5�      5�      �� 5�      y�6   �� *
NotEnCours+   BooleanToVisibilityConverter �� 	Converter# [ .+�5�      .   (ImportManager.View.FactureTransitControl  $
��0,20q�6.    � DataContext 5�   &   �� *FactureTransit+5�      5�      5�      5�      