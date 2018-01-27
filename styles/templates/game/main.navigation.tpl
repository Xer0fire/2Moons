    <div class="sidebar">
      <nav class="sidebar-nav">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="game.php?page=overview" target="_top"><i class="fa fa-tachometer"></i> {$LNG.lm_overview}</a>
          </li>
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-university"></i> BUILDINGS</a>
            <ul class="nav-dropdown-items">
              {if isModuleAvailable($smarty.const.MODULE_IMPERIUM)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=imperium" target="_top"><i class="fa fa-empire"></i> {$LNG.lm_empire}</a>
              </li>
              {/if}
			  {if isModuleAvailable($smarty.const.MODULE_RESSOURCE_LIST)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=resources" target="_top"><i class="fa fa-leaf"></i> {$LNG.lm_resources}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_BUILDING)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=buildings" target="_top"><i class="fa fa-building"></i> {$LNG.lm_buildings}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_RESEARCH)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=research" target="_top"><i class="fa fa-flask"></i> {$LNG.lm_research}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_SHIPYARD_FLEET)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=shipyard&amp;mode=fleet" target="_top"><i class="fa fa-microchip"></i> {$LNG.lm_shipshard}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_SHIPYARD_DEFENSIVE)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=shipyard&amp;mode=defense" target="_top"><i class="fa fa-flag"></i> {$LNG.lm_defenses}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_FLEET_TABLE)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=fleetTable" target="_top"><i class="fa fa-space-shuttle"></i> {$LNG.lm_fleet}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_TECHTREE)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=techtree" target="_top"><i class="fa fa-wrench"></i> {$LNG.lm_technology}</a>
              </li>
			  {/if}
            </ul>
          </li>

          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-users"></i> COMMUNITY</a>
            <ul class="nav-dropdown-items">
			{if isModuleAvailable($smarty.const.MODULE_GALAXY)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=galaxy" target="_top"><i class="fa fa-globe"></i> {$LNG.lm_galaxy}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_ALLIANCE)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=alliance" target="_top"><i class="fa fa-link"></i> {$LNG.lm_alliance}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_STATISTICS)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=statistics" target="_top"><i class="fa fa-line-chart"></i> {$LNG.lm_statistics} <span class="badge badge-pill badge-info align-self-center">1</span></a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_MESSAGES)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=messages" target="_top"><i class="fa fa-envelope"></i> {$LNG.lm_messages}{nocache}{if $new_message > 0} <span class="badge badge-pill badge-success">{$new_message}</span>{/if}{/nocache}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_BUDDYLIST)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=buddyList" target="_top"><i class="fa fa-magic"></i> {$LNG.lm_buddylist}</a>
              </li>
			  {/if}
			  {if isModuleAvailable($smarty.const.MODULE_SUPPORT)}
              <li class="nav-item">
                <a class="nav-link" href="game.php?page=ticket" target="_top"><i class="fa fa-support"></i> {$LNG.lm_support}</a>
              </li>
			  {/if}
            </ul>
          </li>

        </ul>
      </nav>
      <button class="sidebar-minimizer brand-minimizer" type="button"></button>
    </div>