'use strict';
(function () {
    var Select, setVal;
    $.fn.extend({
        select: function (options) {
            return this.each(function (item) {
                var $this = $(this);
                $this.data('select', new Select($this, options))
            })
        },
        setVal: function (options) {
            return this.each(function (item) {
                var $this = $(this);
                $this.data('setVal', new setVal($this, options))
            })
        }
    });
//
    function el_options_val(options){
        var options_val = []
        options.each(function (index, child) {
            var val = $(child).val();
            var text = $(child).text();
            options_val[val] = text;
        })
        return options_val
    }
    function create_options(options) {
        var create_options = '';
        options.each(function (index, child) {
            var val = $(child).val();
            var text = $(child).text();
            create_options += `<li class='option' data-value='${val}'data-key='${index}'>${text}</li>`;
        })
        return create_options;
    }
    function setSingleVal(selected,options_val) {
        var select_val = $(`<span class="select-value ${selected ? '' : 'select-placeholder'}">${selected ? options_val[selected] : '请选择'}</span>${selected ? '<span class="clear-icon"></span>' : ''}<span class="drop-icon"></span> `);
        return select_val
    }


    Select = function (el, opt) {
        var $this = this;
        $this.el = el;
        $this.el.hide();
        var selected = $this.el.val() || opt.val
        var options_val = el_options_val(el.children())
        var parent = $this.el.parent()
        var creat_options_dom = create_options.call($this,el.children())
        var select_model = $('<div class="select-model"></div>');
        var select_single = $(`<div class="select-single "></div>`);
        var select_val = setSingleVal(selected,options_val)
        var select_options = $('<ul class="select-options"></ul>');
        select_single.prepend(select_val);
        select_options.append(creat_options_dom)
        select_model.append(select_single);
        select_model.append(select_options);
        parent.append(select_model);
        select_single.on('click', function (e) {
            console.log(1111)
            e.stopPropagation();
            var hasClass = $(this).parent().hasClass('select-drop');
            if (hasClass) {
                select_model.removeClass('select-drop');
            } else {
                $(document).find('.select-drop').removeClass('select-drop');
                select_model.addClass('select-drop');
            }
        });
        select_options.on('click', 'li', function (e) {
            e.stopPropagation();
            selected = $(this).data('value')
            $this.el.val(selected)
            select_single.empty()
            select_val = setSingleVal(selected,options_val)
            select_single.prepend(select_val)
            select_model.removeClass('select-drop');
        })
        select_single.on('click', '.clear-icon', function (e) {
            e.stopPropagation();
            $this.el.val('')
            select_single.empty()
            select_val = setSingleVal('',options_val)
            select_single.prepend(select_val)
        })
        $(document).click(function () {
            select_model.removeClass('select-drop');
        })

    }
    setVal = function (el, opt) {
        var $this = this;
        $this.el = el;
        var options_val = el_options_val(el.children())
        var selected = opt.val;
        var select_single =el.siblings().find('.select-single')
        select_single.empty()
        var select_val = setSingleVal(selected,options_val)
        select_single.prepend(select_val)
    }
})($);