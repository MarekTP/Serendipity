{if NOT $noForm}
    <form action="?" method="POST">
        <input type="hidden" name="serendipity[adminModule]" value="installer">
        <input type="hidden" name="installAction" value="check">
        {$formToken}
{/if}
{if $config|@sizeof > 1 AND $allowToggle}
    <a id="show_config_all" class="button_link" href="#serendipity_config_options">{$CONST.TOGGLE_ALL}</a>
{/if}
    <div id="serendipity_config_options">
    {foreach $config as $category}
        <div class="configuration_group">
        {if $config|@sizeof > 1}
            <h3>{if $allowToggle}<a id="optionel{$category@iteration}" class="show_config_option" href="#el{$category@index}" title="{$CONST.TOGGLE_OPTION}"><span class="icon-minus-circle"></span> {$category.title}</a>{else}{$category.title}{/if}</h3>
        {/if}
            <fieldset id="el{$category@index}" class="config_optiongroup{if $config_groupkeys@last} config_optiongroup_last{/if} additional_info">
                <legend><span>{$category.description}</span></legend>
        {foreach $category.items as $item}
            {if $item.guessedInput}
                {if $item.type == 'bool'}
                <fieldset>
                    <legend><span>{$item.title} <span>{$item.description}</span></span></legend>
                    <div class="clearfix">
                    {$item.guessedInput}
                    </div>
                </fieldset>
                {else}
                <div class="form_{if $item.type == 'list'}select{elseif $item.type == 'multilist'}multiselect{elseif $item.type == 'textarea'}area{else}field{/if}">
                    <label for="{$item.var}">{$item.title}<span>{$item.description}</span></label>
                    {$item.guessedInput}
                </div>
                {/if}
            {/if}
        {/foreach}
            </fieldset>
        </div>
    {/foreach}
    </div>
{if NOT $noForm}
    <div class="form_buttons">
        <input type="submit" value="{$CONST.CHECK_N_SAVE}">
    </div>
</form>
{/if}
