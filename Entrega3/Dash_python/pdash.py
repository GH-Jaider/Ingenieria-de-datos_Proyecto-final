import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.express as px
import pandas as pd
import consultas as sql
from Connection import Connection

external_stylesheets = ["https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"]

# Inicializacion app dash
app = dash.Dash(__name__, external_stylesheets=external_stylesheets)
con = Connection()
con.openConnection()
cRange = pd.read_sql_query(sql.champRange(), con.connection)
cDeaths = pd.read_sql_query(sql.champDeaths(), con.connection)
cKills = pd.read_sql_query(sql.champKills(), con.connection)
cKD = pd.read_sql_query(sql.champKD(), con.connection)
cNPlayed = pd.read_sql_query(sql.notPlayed(), con.connection)
con.closeConnection()
dfRange = pd.DataFrame(cRange, columns=["champion", "range"])
dfDeaths = pd.DataFrame(cDeaths, columns=["champion","total_deaths"])
dfKills = pd.DataFrame(cKills, columns=["champion","total_kills"])

# Graficos de Linea
lineBarRange = px.line(dfRange, x = "champion", y = "range")

# Graficos barras
figBarRange = px.bar(dfRange, x = "champion", y = "range")
figBarKD = px.bar(cKD, x = "champion", y = "kd")

# Graficos disperción
figDispDeaths = px.scatter(dfDeaths, x = "champion", y = "total_deaths")
figDispKills = px.scatter(dfKills, x = "champion", y = "total_kills")
figDispKD = px.scatter(cKD, x = "champion", y = "kd")

# Graficos de torta
figPieDeaths = px.pie(dfDeaths.head(15), values="total_deaths", names="champion", title="Top 15 champions with more deaths")
figPieKills = px.pie(dfKills.head(15), values="total_kills", names="champion", title="Top 15 champions with more kills")


# Layout 
app.layout = html.Div(children=[
    html.H1(children='LoL Game Stats'),
    html.H2(children='Average Range'),
    dcc.Graph(
        id = 'barAvgRange',
        figure = figBarRange
    ),
    dcc.Graph(
        id = 'lineAvgRange',
        figure = lineBarRange
    ),
    html.H2(children='Total Deaths'),
    dcc.Graph(
        id = "dispTotalDeaths",
        figure = figDispDeaths
    ),
    dcc.Graph(
        id = "piTotalDeaths",
        figure = figPieDeaths
    ),
    html.H2(children='Total Kills'),
    dcc.Graph(
        id = "dispTotalKills",
        figure = figDispKills
    ),
    dcc.Graph(
        id = "piTotalKills",
        figure = figPieKills
    ),
    html.H2(children='Kill/Die ratio'),
    dcc.Graph(
        id = "barKD",
        figure = figBarKD
    ),
    dcc.Graph(
        id = "dispKD",
        figure = figDispKD
    ),
    html.H2(children='Not Played Champions'),
    dash.dash_table.DataTable(
        id = "tableNotPlayed",
        columns=[{"name": i, "id": i} 
                 for i in cNPlayed.columns],
        data = cNPlayed.to_dict('records'),
        style_cell=dict(textAlign='center')
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)
