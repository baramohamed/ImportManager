   M S B A M L   `   `   `  ����H  DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View  5      V RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf 5      *    $ImportManager.View.DomiciliationPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ImportManager.View     5      cMaterialDesignHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5      .��5
      )  #MaterialDesignThemes.Wpf.DialogHost      IsOpen  6    �� *IsDialogOpen+   DialogContent 5   
   �� 5      $��Bottom=�6   .+�5      ��    FileTemplate#��[  5      ��5      �� *SelectedDocument.Fichiers+��5      �� 5      .R�5      � $	��600��6(   $	��500��5   (   $��10q�5   (   5      5      � 5       � ColumnDefinitions 5      �� 5      �� 5      .+�5      �� $��
Ajouter...��6   ��5      �� *!SelectedDocument.AjouterFichier+�� 5      $��Fermer��6   $��1��5       ��5!      �� *CloseDialog+5"      5#      .��5%   
   �� $��10q�6   .+�5&      �� $��Banque��6   $��25(�5'      $
��Left=�5(      � 5)      $��10q�6    5*      �� 5+      �� 5,      .+�5.      �� $��0��6   .+�5/      �� -   5         ��Name$ BanqueImportateur��5/      )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Choisir Banque��6:    �� DisplayMemberPath$ Denomination��52      ��50      �� *	Banques+ �� SelectedItem 51      �� *SelectedBanque+ �� Mode$ OneWay=�52      �� 53      $ Financement��6   $ Designation��56      ��54      �� *ModesFinancement+ 55      �� *Financement+56      �� 57      $ Produit Destiné à��6   $ Designation��5:      ��58      �� *DestinationsProduit+ 59      �� *DestinationProduit+5:      �� 5;      $ N° Pré-Domiciliation��6   ��5<      �� *NPreDomiciliation+�� 5=      $ Cours de Domiciliation��6   ��5>      �� *Cours+ �� StringFormat$ {0:N2}��5?      �� 5@      $��1��6   .+�5A      �� $ Agence��6   $ Designation��5D      ��5B      �� *SelectedBanque.Agences+ 5C      �� *AgenceBanqueImportateur+5D      � 5E      $��50��6   $��10q�5F      $��18(�5G       5H      �� 5I      $
��Auto �6/   �� 5J      �� 5K      .+�5M      �� $��	Facture: ��6$   $
��20,0q�5N   $   $��Center=�5O   $   	� 5P      $��1��6&   $��Proforma��5Q   &   $��Center=�5R   &   	 d� 	IsChecked	 5S   &   �� *
IsProforma+	� 5T      $��2��6&   $��Définitive��5U   &   $��Center=�5V   &   	 5W   &   �� *IsDefinitive+5X      (  "System.Windows.Controls.DatePicker  5Y      $ Date Expédition��6!   
   SelectedDate
 5Z   !   �� *DateExpedition+  5[      $ Date Pré-Domiciliation��6!   
 5\   !   �� *DatePreDomiciliation+5]      5^      �� 5_       �� Orientation$ 
Horizontal=�6   .+�5`      �� $��Ordre d'Achat��6   $��25(�5a      $��Center=�5b      $
��Left=�5c      $��10q�5d      �� 5e      $	��150��5f      $
 Lieu��5g      ��5e      �� *LieuOrdreAchat+5g        5h      $
 Date��6   $	��150��5j      
 5i      �� *DateOrdreAchat+5j      �� 5k      $ Facture��6   $	��150��5l      �� 5m        
IconButton#��[ 6     PrinterIcon#��[ 5o      $��Right=�5p      $��50��5q      ��5n      �� *PrintCommand+5q      5r      �� 5s      $��Taxe Domiciliation��6   $��25(�5t      $
��Left=�5u      $��10q�5v      �� 5w      $ 
Horizontal=�6   $��18(�5x      .+�5y      �� $��Direction des Impôts:��6   $��Center=�5z      $��20,10q�5{      �� 5|      -   5        $ WilayaImpots��5|      $ Wilaya��61   $	��100��5}      $ Designation��5      ��5~      �� *	Wilayas+5      �� 5�      $ Recette��6   $	��100��5�      $ Designation��5�      ��5�      ��  �� ElementName$ WilayaImpots�� �� Path$! SelectedItem.RecettesImpots� 5�      �� *RecetteImpots+5�        5�      $
 Date��6   $	��150��5�      �� 5�      #��[ 6   #��[ 5�      $��Right=�5�      $��50��5�      ��5�      �� *	PrintTaxe+5�      5�      �� 5�      $ 
Horizontal=�6   .+�5�      �� $/��)Demande de Franchise des Droits de Douane��6   $��25(�5�      $��Center=�5�      $
��Left=�5�      $��10q�5�      �� 5�      #��[ 6   #��[ 5�      $��Right=�5�      $��50��5�      ��5�      �� *PrintFranchise+5�      5�      �� 5�      $
��0,20q�6   y�5�      �� *
NotEnCours+   BooleanToVisibilityConverter �� 	Converter# [ .+�5�      �� $��Facture Définitive��6   $��25(�5�      $��10q�5�      $
��Left=�5�      1   +ImportManager.View.FactureDefinitiveControl  5�       � DataContext 61   �� *FactureDefinitive+�� 5�      $ 
Horizontal=�6   .+�5�      �� $$��Connaissement (Bill of Lading)��6    $��25(�5�      $��Center=�5�      $
��Left=�5�      $��10q�5�      �� 5�      $ 
Horizontal=�6!    6:   �� *Connaissement+.+�5�        $
 Date��6%   $	��150��5�      
 5�      �� *Date+5�      �� 5�      $	 N°��6"   $	��150��5�      ��5�      �� *Num+5�      5�      �� 5�      #��[ 6     PaperClipIcon#��[ 5�      $��Right=�5�      $��50��5�      ��5�      �� *JoinConnaissement+5�      5�      �� 5�      $ 
Horizontal=�6   .+�5�      �� $��Cetificat d'Origine��6    $��25(�5�      $��Center=�5�      $
��Left=�5�      $��10q�5�      �� 5�      $ 
Horizontal=�6!    6:   �� *CertificatDOrigine+.+�5�        $
 Date��6%   $	��150��5�      
 5�      �� *Date+5�      �� 5�      $	 N°��6"   $	��150��5�      ��5�      �� *Num+5�      5�      �� 5�      #��[ 6   #��[ 5�      $��Right=�5�      $��50��5�      ��5�      �� *JoinCertificatDOrigine+5�      5�      �� 5�      $ 
Horizontal=�6   .+�5�      �� $��Certificat de Conformité��6    $��25(�5�      $��Center=�5�      $
��Left=�5�      $��10q�5�      �� 5�      $ 
Horizontal=�6!    6:   �� *CertificatDeConformite+.+�5�        $
 Date��6%   $	��150��5�      
 5�      �� *Date+5�      �� 5�      $	 N°��6"   $	��150��5�      ��5�      �� *Num+5�      5�      �� 5�      #��[ 6   #��[ 5�      $��Right=�5�      $��50��5�      ��5�      �� *JoinCertificatDeConformite+5�      5�      �� 5�      $ 
Horizontal=�6   .+�5�      �� $'��!Liste de Colissage (Packing List)��6    $��25(�5�      $��Center=�5�      $
��Left=�5�      $��10q�5�      �� 5�      $ 
Horizontal=�6!    6:   �� *ListeDeColissage+.+�5�        $
 Date��6%   $	��150��5�      
 5�      �� *Date+5�      �� 5�      $	 N°��6"   $	��150��5�      ��5�      �� *Num+5�      5�      �� 5�      #��[ 6   #��[ 5�      $��Right=�5�      $��50��5�      ��5�      �� *JoinListeDeColissage+5�      5�      5�      5�      5�      5�      