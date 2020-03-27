<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registrazione.aspx.cs" Inherits="_Default" %>
<script runat="server">
    [DirectMethod]
    public static void ShowTerms()
    {
        
    }

    
</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Registration Form</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />

     <style>
        /* Styling of global error indicator */
        .form-error-state {
            font-size: 11px;
            padding-left: 20px;
            height: 16px;
            line-height: 18px;
            background: no-repeat 0 0;
            cursor: default;
        }
        .form-error-state-invalid {
            color: #C30;
            background-image: url(../../../../icons/exclamation-png/ext.axd);
        }
        .form-error-state-valid {
            color: #090;
            background-image: url(../../../../icons/accept-png/ext.axd);
        }

        /* Error details tooltip */
        .errors-tip .error {
            font-style: italic;
        }
    </style>

    <script>
        function updateErrorState(form) {
            var me = form,
                errorCmp, fields, errors;

            if (me.hasBeenDirty || me.getForm().isDirty()) { //prevents showing global error when form first loads
                errorCmp = me.down('#formErrorState');
                fields = me.getForm().getFields();
                errors = [];
                fields.each(function (field) {
                    Ext.Array.forEach(field.getErrors(), function (error) {
                        errors.push({ name: field.getFieldLabel(), error: error });
                    });
                });
                setErrors(errorCmp, errors);
                me.hasBeenDirty = true;
            }
        }

        function boxLabelClick(e) {
            var target = e.getTarget('.terms'),
                win;

            e.preventDefault();

            if (target) {
                App.direct.ShowTerms();
            }
        }

        function setErrors(cmp, errors) {
            var me = cmp,
                baseCls = me.baseCls,
                tip = me.tooltips[0];

            errors = Ext.Array.from(errors);

            // Update CSS class and tooltip content
            if (errors.length) {
                me.addCls(baseCls + '-invalid');
                me.removeCls(baseCls + '-valid');
                me.update("Form has errors");
                tip.setDisabled(false);
                if (!tip.rendered) {
                    tip.show();
                }
                tip.update(me.bin[0].apply(errors));
            } else {
                me.addCls(baseCls + '-valid');
                me.removeCls(baseCls + '-invalid');
                me.update("Form is valid");
                tip.setDisabled(true);
                tip.hide();
            }
        }
    </script>
</head>
<body>
    <form runat="server">
        <ext:ResourceManager runat="server" />

        <br />

        <ext:FormPanel
            ID="FormPanel1"
            runat="server"
            Frame="true"
            Width="350"
            BodyPadding="10"
            BodyBorder="1"
            Title="Account Registration"
            DefaultAnchor="50%">

            <FieldDefaults LabelAlign="left" MsgTarget="None" InvalidCls="" />

            <Listeners>
                <FieldValidityChange Fn="updateErrorState" />
                <FieldErrorChange Fn="updateErrorState" />
            </Listeners>

            <Items>

                <ext:TextField
                    runat="server"
                    Name="email"
                    ID="email"
                    FieldLabel="Email Address"
                    AllowBlank="false"/>

                <ext:TextField
                    runat="server"
                    Name="nome"
                    ID="nome"
                    FieldLabel="nome"
                    AllowBlank="false"/>

                <ext:TextField
                    runat="server"
                    Name="password1"
                    FieldLabel="Password"
                    ID="password"
                    InputType="Password"
                    StyleSpec="margin-top:15px;"
                    AllowBlank="false"
                    MinLength="8" />

                <ext:TextField
                    runat="server"
                    Name="password2"
                    ID="password2"
                    FieldLabel="Repeat Password"
                    InputType="Password"
                    AllowBlank="false">
                    <Validator Handler="return (value === this.previousSibling('[name=password1]').getValue()) ? true : 'Passwords do not match.';" />
                </ext:TextField>

            </Items>

            <DockedItems>
                <ext:Container
                    runat="server"
                    Dock="Bottom"
                    PaddingSpec="10 10 5">

                    <LayoutConfig>
                        <ext:HBoxLayoutConfig Align="Middle" />
                    </LayoutConfig>

                    <Items>
                        <ext:Component
                            runat="server"
                            ItemID="formErrorState"
                            BaseCls="form-error-state"
                            Flex="1">
                            <Bin>
                                <ext:XTemplate runat="server">
                                    <Html>
                                        <ul>
                                            <tpl for=".">
                                                <li>
                                                    <span class="field-name">{name}</span> : <span class="error">{error}</span>
                                                </li>
                                            </tpl>
                                        </ul>
                                    </Html>
                                </ext:XTemplate>
                            </Bin>
                            <ToolTips>
                                <ext:ToolTip
                                    runat="server"
                                    Title="Error Details:"
                                    AutoHide="false"
                                    Anchor="top"
                                    MinWidth="200"
                                    MouseOffset="-11,-2"
                                    Closable="true"
                                    Disabled="true"
                                    ConstrainPosition="false"
                                    Cls="errors-tip" />
                            </ToolTips>
                        </ext:Component>      
                        <ext:Button
                            runat="server"
                            FormBind="true"
                            Disabled="true"
                            Text="Submit Registration"
                            Width="140">
                            <DirectEvents>
                                <Click OnEvent="Registra">
                                    <EventMask ShowMask="true" />
                                </Click>
                            </DirectEvents>
                        </ext:Button>
                    </Items>
                </ext:Container>
            </DockedItems>
        </ext:FormPanel>
    </form>
</body>
</html>