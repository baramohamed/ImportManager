   M S B A M L   `   `   `  ����H  DImportManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ImportManager.ViewImportManager.View  5      V RMaterialDesignThemes.Wpf, Version=2.4.0.1044, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf 5      {Sclr-namespace:MaterialDesignThemes.Wpf.Converters;assembly=MaterialDesignThemes.Wpf#MaterialDesignThemes.Wpf.Converters 5      "    ImportManager.View.SearchBox   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      2local clr-namespace:ImportManager.View     5      XwpfHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf     5      j
convertersSclr-namespace:MaterialDesignThemes.Wpf.Converters;assembly=MaterialDesignThemes.Wpf     5      .��5
      �� $��0q�6   $��Stretch=�5   	   $��0q�5   	   $
��Auto��5   	   $
��Auto��5   	     �� 
IsEditable  . ��5   
   �� 5       �� 
TargetType" ��6   .R�5      �  �Name$ templateRoot��6   #��z��5       J� SnapsToDevicePixels . .+�5      � $ 	InnerRoot��6    � ColumnDefinitions 5      �� 5      $��* �6/   �� 5      $��0 �6/   #��� r�69   .+�5      d�  d�Name$ toggleButton��6'   $��2��5   !   #��z��5   !   #��z��5   !   #��z��5   !    &  "MaterialDesignComboBoxToggleButton#��[  5    !    d� 	IsChecked 5   !   �� *IsDropDownOpen+ �� Mode$ TwoWay=� �� RelativeSource �� *TemplatedParent+5    !   � 5!      #��z��6   #��z��5"   !   # z 5#   !   	 � UseLayoutRounding#	 z	 5$   !   .+�5%      � $ 	InputRoot��6#   .+�5&   "   �� 
 ��Name$
 contentPresenter��63    �� SelectionBoxItem#��z 5'   )   # �� SelectionBoxItemStringFormat �� ContentStringFormat# z 5(   )    �� SelectionBoxItemTemplate#��z 5)   )   #��z��5*   )    J� IsHitTestVisible .  5+   )   �� 5,   "    ��Name$ PART_EditableTextBox��6*   $
��Left=�5.   -   $��Stretch=�5/   -    ) %MaterialDesignComboBoxEditableTextBox#��[ 50   -   $y�Visible=�52   -    �� Text#��z 53   -   $��0q�54   -    �� 
IsReadOnly 5-   -   �� *
IsReadOnly+ �� *TemplatedParent+ �� 
CaretBrush 51   -   ��  �� *TemplatedParent+ �� Path$ BorderBrush�54   -   (  "MaterialDesignThemes.Wpf.SmartHint  56   "     Name$
 Hint��60   #��z��58   %   # z 59   %   #	 z	 5:   %   )  #MaterialDesignThemes.Wpf.HintAssist   Hint   Hint# z 5=   %      	HintProxy 57   %   ��  �� *TemplatedParent+B  <MaterialDesignThemes.Wpf.Converters.HintProxyFabricConverter   Instance �� 	Converter# Z    UseFloating 5;   %   �� $! (wpf:HintAssist.IsFloating)� �� *TemplatedParent+   HintOpacity 5<   %   �� $" (wpf:HintAssist.HintOpacity)� �� *TemplatedParent+5=   %   5>      5?      �� 5@       ��Name$ 
DashedLine��6   $��2��63   $��Bottom=�6G   $
��1.25��5B   !    �� StrokeDashArray$ 1,2.5R�68    �� StrokeDashCap$ Round=�6P   	  �� X1$  0��5C   !   	! �� Y1$! 0��6]   	" �� Y2$" 0��6d   #��z��5D   !   # J� Opacity$
# 0.56Q�6H   y�5A   !   �� $ 	IsEnabled� �� *Self+  InverseBoolToVisConverter# [ 	$ �� X2$ 5C   (   �� *ActualWidth+% �� ElementName$% toggleButton��5D   H   (  "MaterialDesignThemes.Wpf.Underline  5E      &  Name$& 	Underline��6(   $��2��5F   !   '   IsActive' 5G   !   �� $% PART_EditableTextBox��$ IsKeyboardFocused�y�5H   !   �� $0 *(wpf:TextFieldAssist.DecorationVisibility)� �� *TemplatedParent+,  &MaterialDesignThemes.Wpf.ComboBoxPopup  5J      (  Name$( 
PART_Popup��6,   ) � AllowsTransparency) . |�.  * � HorizontalOffset$* -11.5��5M   !    . 	 . $��Custom=�5R   !   $
��Fade=�5S   !   + � VerticalOffset$+ 0��5T   !   ,   DefaultVerticalOffset$, 5Q�5U   !   -   DownVerticalOffset$- -15.5Q�5V   !   .   UpVerticalOffset$. 15Q�5W   !     PopupContentUpTemplate/   UpContentTemplate#/ [ 5Y   !     PopupContentDownTemplate0   DownContentTemplate#0 [ 5Z   !     PopupContentClassicTemplate1   ClassicContentTemplate#1 [ 5[   !   ��5N   !   �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+2 � PlacementTarget2 5O   !   �� $% templateRoot��3   ClassicMode3 5X   !   �� $&  (wpf:ComboBoxAssist.ClassicMode)� �� *TemplatedParent+.��5\      �� .��5]   "   �� 4 �� MaxDropDownHeight#��z4 6/   ��5^   %   �� *
Background+$% 
PART_Popup��.��5_   &   �� 5 ��Name$5 ItemsPresenter��65   -  'System.Windows.Input.KeyboardNavigation6   DirectionalNavigation$6 	Contained=�6M   5`   #   5a      5b      5c      5d      7 �� Triggers7 5e      P� 5f      8 P� 
SourceName$8 
PART_Popup��6   5  /MaterialDesignThemes.Wpf.ComboBoxPopupPlacement9   Classic: P� Value#: Z9 6P   ; P� Property; �@ PopupPlacement. �5g      ��  # MaterialDesignComboBoxItemStyle< �� Value#< [ 6?   = �� Property= � ��5h      P� 5i      $8 
PART_Popup��6   ; � ��: . . �5j      �� > �� 
TargetName$> templateRoot��67   < 6Q   �� *
Background+$% 
PART_Popup��= � ��5k      P� 5l      ; � {�: .  . �5m      �� $> templateRoot��6!   = �@J�Opacity$
< 0.56Q�6N   �� 5n      $> toggleButton��6!   = � ��
< ���� 6R   5o      P� 5p      ; �@��
IsEditable: . . �5q      �� $> PART_EditableTextBox��6!   = � y�$< Visible=�6Y   �� 5r      $> 	Underline��6!   < 6N   �� $0 *(wpf:TextFieldAssist.DecorationVisibility)� �� *TemplatedParent+= � y��� 5s      $> contentPresenter��6!   = � y�$< 	Collapsed=�6U   5t      P� 5u      ; �@ 
IsFloating: . . �5v      �� $> 	InnerRoot��6!   = � ��$< 
0 11.5 0 0q�6J   5w      ]� 5x      ? ]� 
Conditions? 5y      �� 5z      @ �� Property@ �@��
IsEditableA �� ValueA .  6>   �� 5{      @ �@��IsDropDownOpenA . 6B   ./�5}      �� $> 	Underline��6!   = � y�$< Hidden=�6N   �� 5~      $> toggleButton��6!   = � ��
< ���� 6R   5      ]� 5�      ? 5�      �� 5�      B �� 
SourceName$
B Hint��6(   @ �@ IsContentNullOrEmptyA .  6Z   �� 5�      @ �@ 
IsFloatingA . 6M   �� 5�      @ �@J�IsKeyboardFocusWithinA . 6I   ./�5�      �� $
> Hint��6!     PrimaryHueMidBrush#< �  6I   = � ���� 5�      $
> Hint��6!   = �@ HintOpacity$< 1Q�6J   5�      ]� 5�      ? 5�      �� 5�      @ �@ 
IsFloatingA . 6M   �� 5�      $
B Hint��6(    @ �@ IsHintInFloatingPositionA . 6^   �� 5�      @ �@J�IsKeyboardFocusWithinA . 6I   ./�5�      �� $
> Hint��6!   #< �  6I   = � ���� 5�      $
> Hint��6!   = �@ HintOpacity$< 1Q�6J   5�      ]� 5�      ? 5�      �� 5�      $
B Hint��6(   @ �@ IsContentNullOrEmptyA .  6Z   �� 5�      $B PART_EditableTextBox��6(   @ �@J�IsKeyboardFocusedA . 6g   ./�5�      �� $
> Hint��6!   #< �  6I   = � ���� 5�      $
> Hint��6!   = �@ HintOpacity$< 1Q�6J   5�      ]� 5�      ? 5�      �� 5�      $
B Hint��6(   @ �@ IsContentNullOrEmptyA .  6Z   �� 5�      @ �@��IsDropDownOpenA . 6B   ./�5�      �� $
> Hint��6!   #< �  6I   = � ���� 5�      $
> Hint��6!   = �@ HintOpacity$< 1Q�6J   5�      ]� 5�      ? 5�      �� 5�      @ �@��
IsGroupingA . 6>   �� 5�      "@ �@%�IsVirtualizingWhenGroupingA .  6`   ./�5�      �� = � ��< .  6J   5�      P� 5�      ; �@J�IsKeyboardFocused: . . �5�      �� $> 	Underline��6!   = �@ IsActive< . 6L   5�      P� 5�      ; �@=�HasError: . . �5�      ��   ValidationErrorBrush#< �  68   = � ���� 5�      $> 	Underline��6!   #< �  6N   = � ��5�      ]� 5�      ? 5�      �� 5�      @ �@J�IsMouseOverA . 6?   �� 5�      @ �@=�HasErrorA . 6G   ./�5�      �� #< �  68   = � ���� 5�      $> 	Underline��6!   #< �  6N   = � ��5�      ]� 5�      ? 5�      �� 5�      @ �@J�IsMouseOverA . 6?   �� 5�      @ �@=�HasErrorA .  6G   ./�5�      �� #< �  68   = � ���� 5�      $> 	Underline��6!   #< �  6N   = � ��5�      5�      5�      5�      