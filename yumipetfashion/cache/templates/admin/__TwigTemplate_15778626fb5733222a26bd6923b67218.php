<?php

/* order.manage.row.tpl */
class __TwigTemplate_15778626fb5733222a26bd6923b67218 extends Twig_Template
{
    public function display(array $context)
    {
        // line 1
        echo "
\t<tr id=\"tr";
        // line 2
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" class=\"GridRow\" onmouseover=\"this.className='GridRowOver'\" onmouseout=\"this.className='GridRow'\">
\t\t<td align=\"center\" style=\"width:23px\">
\t\t\t<input type=\"checkbox\" name=\"orders[]\" value=\"";
        // line 4
        echo twig_safe_filter((isset($context['OrderId1']) ? $context['OrderId1'] : null));
        echo "\" class=\"exportSelectableItem\" />
\t\t</td>
\t\t<td align=\"center\" style=\"width:15px\">
\t\t\t<a href=\"#\" onclick=\"QuickView('";
        // line 7
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "'); return false;\"><img id=\"expand";
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" src=\"images/plus.gif\" align=\"left\" width=\"19\" class=\"ExpandLink\" height=\"16\" title=\"";
        echo getLang("ExpandQuickView");
        echo "\" border=\"0\"></a>
\t\t</td>
\t\t<td align=\"center\" style=\"width:18px\">
\t\t\t<img src=\"images/";
        // line 10
        echo twig_safe_filter((isset($context['OrderIcon']) ? $context['OrderIcon'] : null));
        echo "\" width=\"16\" height=\"16\" />
\t\t</td>
\t\t<td class=\"";
        // line 12
        echo twig_safe_filter((isset($context['SortedFieldIdClass']) ? $context['SortedFieldIdClass'] : null));
        echo "\">
\t\t\t";
        // line 13
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "
\t\t</td>
\t\t<td colspan=\"";
        // line 15
        echo twig_safe_filter((isset($context['CustomerNameSpan']) ? $context['CustomerNameSpan'] : null));
        echo "\" class=\"";
        echo twig_safe_filter((isset($context['SortedFieldCustClass']) ? $context['SortedFieldCustClass'] : null));
        echo "\">
\t\t\t";
        // line 16
        echo twig_safe_filter((isset($context['CustomerLink']) ? $context['CustomerLink'] : null));
        echo "
\t\t</td>
\t\t<td class=\"";
        // line 18
        echo twig_safe_filter((isset($context['SortedFieldDateClass']) ? $context['SortedFieldDateClass'] : null));
        echo "\">
\t\t\t";
        // line 19
        echo twig_safe_filter((isset($context['Date']) ? $context['Date'] : null));
        echo "
\t\t</td>
\t\t<td id=\"order_status_column_";
        // line 21
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" style=\"border-left-style: solid; border-left-width: 10px; width:165px;\" class=\"";
        echo twig_safe_filter((isset($context['SortedFieldStatusClass']) ? $context['SortedFieldStatusClass'] : null));
        echo " OrderStatus OrderStatus";
        echo twig_safe_filter((isset($context['OrderStatusId']) ? $context['OrderStatusId'] : null));
        echo "\" nowrap=\"nowrap\">
\t\t\t<select onclick=\"order_status_before_change=this.selectedIndex; status_box=this\" id=\"status_";
        // line 22
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" name=\"status_";
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" class=\"Field\" onchange=\"update_order_status('";
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "', this.options[this.selectedIndex].value, this.options[this.selectedIndex].text)\">
\t\t\t\t";
        // line 23
        echo twig_safe_filter((isset($context['OrderStatusOptions']) ? $context['OrderStatusOptions'] : null));
        echo "
\t\t\t</select>
\t\t\t<img id=\"ajax_status_";
        // line 25
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" src=\"images/ajax-blank.gif\" />
\t\t\t<div class=\"";
        // line 26
        echo twig_safe_filter((isset($context['PaymentStatusColor']) ? $context['PaymentStatusColor'] : null));
        echo "\" style=\"";
        echo twig_safe_filter((isset($context['HidePaymentStatus']) ? $context['HidePaymentStatus'] : null));
        echo "\">
\t\t\t\t";
        // line 27
        echo twig_safe_filter((isset($context['PaymentStatus']) ? $context['PaymentStatus'] : null));
        echo "
\t\t\t</div>
\t\t</td>
\t\t<td style=\"text-align: center; display: ";
        // line 30
        echo twig_safe_filter((isset($context['HideOrderMessages']) ? $context['HideOrderMessages'] : null));
        echo "\" class=\"";
        echo twig_safe_filter((isset($context['SortedFieldMessageClass']) ? $context['SortedFieldMessageClass'] : null));
        echo "\">
\t\t\t";
        // line 31
        echo twig_safe_filter((isset($context['MessageLink']) ? $context['MessageLink'] : null));
        echo "
\t\t</td>
\t\t<td style=\"text-align: right;\" class=\"";
        // line 33
        echo twig_safe_filter((isset($context['SortedFieldTotalClass']) ? $context['SortedFieldTotalClass'] : null));
        echo "\">
\t\t\t";
        // line 34
        echo twig_safe_filter((isset($context['Total']) ? $context['Total'] : null));
        echo "
\t\t</td>
\t\t<td nowrap=\"nowrap\" align=\"right\">
\t\t\t";
        // line 37
        echo twig_safe_filter((isset($context['NotesIcon']) ? $context['NotesIcon'] : null));
        echo "
\t\t\t";
        // line 38
        echo twig_safe_filter((isset($context['CommentsIcon']) ? $context['CommentsIcon'] : null));
        echo "
\t\t</td>
\t\t<td align=\"center\" class=\"";
        // line 40
        echo twig_safe_filter((isset($context['FlagCellClass']) ? $context['FlagCellClass'] : null));
        echo "\" style=\"width: 18px; display: ";
        echo twig_safe_filter((isset($context['HideCountry']) ? $context['HideCountry'] : null));
        echo "\">
\t\t\t";
        // line 41
        echo twig_safe_filter((isset($context['OrderCountryFlag']) ? $context['OrderCountryFlag'] : null));
        echo "
\t\t</td>
\t\t<td>
\t\t\t<select name=\"order_options_";
        // line 44
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" id=\"order_action_";
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" onchange=\"Order.HandleAction('";
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "', \$(this).val());\">
\t\t\t\t<option value=\"\">-- ";
        // line 45
        echo getLang("Actions");
        echo " --</option>
\t\t\t\t<option value=\"editOrder\">";
        // line 46
        echo getLang("EditOrder");
        echo "</option>
\t\t\t\t<option value=\"printInvoice\">";
        // line 47
        echo getLang("PrintInvoice");
        echo "</option>
\t\t\t\t<option value=\"printPackingSlip\">";
        // line 48
        echo getLang("PrintPackingSlip");
        echo "</option>
\t\t\t\t<option value=\"orderNotes\" class=\"";
        // line 49
        echo twig_safe_filter((isset($context['HasNotesClass']) ? $context['HasNotesClass'] : null));
        echo "\">";
        echo getLang("OrderNotesLink");
        echo "</option>
\t\t\t\t";
        // line 50
        echo twig_safe_filter((isset($context['ShipItemsLink']) ? $context['ShipItemsLink'] : null));
        echo "
\t\t\t\t";
        // line 51
        if ($this->getAttribute((isset($context['order']) ? $context['order'] : null), "ordtotalshipped", array(), "any") > 0) {
            echo "\t\t\t\t\t<option value=\"viewShipments\">";
            // line 52
            echo twig_escape_filter($this->env, $this->getAttribute((isset($context['lang']) ? $context['lang'] : null), "ViewShipments", array(), "any"), "1");
            echo "</option>
\t\t\t\t";
        }
        // line 53
        echo "\t\t\t\t";
        // line 54
        echo twig_safe_filter((isset($context['DelayedCaptureLink']) ? $context['DelayedCaptureLink'] : null));
        echo "
\t\t\t\t";
        // line 55
        echo twig_safe_filter((isset($context['VoidLink']) ? $context['VoidLink'] : null));
        echo "
\t\t\t\t";
        // line 56
        echo twig_safe_filter((isset($context['RefundLink']) ? $context['RefundLink'] : null));
        echo "
\t\t\t</select>
\t\t</td>
\t</tr>
\t<tr id=\"trQ";
        // line 60
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" style=\"display:none\">
\t\t<td></td>
\t\t<td colspan=\"12\" id=\"tdQ";
        // line 62
        echo twig_safe_filter((isset($context['OrderId']) ? $context['OrderId'] : null));
        echo "\" class=\"QuickView\"></td>
\t</tr>";
    }

}
