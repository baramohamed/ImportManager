   M S B A M L   `   `   `  ����H  DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View  5      E ADragablz, Version=0.0.3.203, Culture=neutral, PublicKeyToken=null5(clr-namespace:Dragablz;assembly=DragablzDragablz 5      (    "ImportManager.View.ImportationPage   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ImportManager.View     5      =dragablz(clr-namespace:Dragablz;assembly=Dragablz     5        � 	Resources  5         ActiviteTemplate � ColumnDefinitions  EntrepriseTemplate  NegociationPageDataTemplate(   "ImportManager.View.NegociationPage ! DomiciliationPageDataTemplate*   $ImportManager.View.DomiciliationPage   DedouanementPageDataTemplate)   #ImportManager.View.DedouanementPage  CloturationPageDataTemplate(   "ImportManager.View.CloturationPage  BilanPageDataTemplate"   ImportManager.View.BilanPage  TabControlNormalBorderBrush �� Color��%  &	        &	 �     &	 �    &	     &	 6    &	 ^    &	 �    &	 �    �� 5   
   .R�5      �  5      �� 5      $��* �6'   �� 5      $��3* �6'   .+�5      �� $��0,0,10,0q�62   ��6   �� *Code+62   �� 5      $��1��69   ��6   �� *Designation+69   5      5      �� 5   
   .R�5      �  5      �� 5      $��* �6'   �� 5      $��3* �6'   .+�5      �� $��0,0,10,0q�60   ��6   �� *Id+60   �� 5      $��1��69   ��6   �� *Designation+69   5      5      �� 5    
   .R�5!        5"      �� 5#   
   .R�5$        5%      �� 5&   
   .R�5'        5(      �� 5)   
   .R�5*        5+      �� 5,   
   .R�5-        5.      �� 5/   
   $ #8C8E94��6>   50      .��51      �  � RowDefinitions 52   
   �� 53      $
��Auto �6   �� 54      .+�56   
   �� .+�57      �  58      �� 59      $
��Auto �6'   �� 5:      $
��Auto �6'   �� 5;      .+�5=      �� $��Import N°: ��6    
 Title1#��[ 5>      $��	120,0,0,0q�5?      �� 5@      #��[ 5A      $��1��5B      ��5@      �� *	NumImport+5B      �� 5C      $��	Clôturer��6   $��2��5D      $��Right=�5E      $��10q�5F      ��5G      �� *
Cloturer+5H      9� 5I      $��Initialisation��6    9� 
IsExpanded .  .��5K      �� .+�5L      � $
��Left=�6    5M      �� 5N      �� 5O      �� 5P      .+�5R      �� $��Importateur: ��6$   $��Center=�5S       
	 Title2#��[	 5T      $
��10,0q�5U      �� 5V      $��1��6#   $	��200��5W      $
��10,0q�5X       �� DisplayMemberPath$ Denomination��5[      ��5Y      �� *Importateurs+ �� SelectedItem 5Z      �� *Importateur+5[      �� 5\      -   5         
 SettingsIcon#��[
 5\   !     
IconButton#��[ 5]      $��2��5^      $
��10,0q�5_      5`      5a      �� 5b       �� Orientation$ 
Horizontal=�6!   .+�5c      �� $��	Avivité:��6$   #��[	 5d      $
��10,0q�5e      �� 5f      $	��250��6$   $
��10,0q�5g      $ Designation��5j      ��5h      �� *	Activites+ 5i      �� *
Activite+5j      5k      � 5l       5m      �� 5n      $
��Auto �6/   �� 5o      $
��Auto �6/   �� 5p      $
��Auto �6/   .+�5r      �� $��Fournisseur: ��6$   #��[	 5s      $
��10,0q�5t      �� 5u      $��1��6#   $	��200��5v      $
��10,0q�5w      $ Denomination��5z      ��5x      �� *Fournisseurs+ 5y      �� *Fournisseur+5z      �� 5{      -   5        #��[
 5{   !   #��[ 5|      $��2��5}      $
��10,0q�5~      5      5�      5�      5�      �� 5�      $��Center=�5�       �� SelectedIndex$ 0��5�      ��5�      �� *
Operations+ 5�      �� *SelectedOperation+��5�      �� 5�      .R�5�      �� $ 
Horizontal=�6%   5�      ��5�      �� 5�      .R�5�      �� $ 
Horizontal=�6%   .+�5�      ��   DoubleArrowRightIcon#��[ 6-   $��40��5�   -   $��0q�5�   -   �� 5�      $��0q�5�   (   $��24(�5�   (   	 �� Padding$	 10q�5�   (   ��5�   (   �� *Titre+5�   (   5�      5�      5�      5�      �� 5�   
   $��1��6   .��5�      ��   OperationTemplateSelector#��[ 5�      ��5�      �� *SelectedOperation+5�      5�      5�      5�      